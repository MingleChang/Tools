//
//  MCRootViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/10/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCRootViewController.h"
#import "MCToolManager.h"
#import "MCToolCate.h"
#import "MCTool.h"
#import "MCToolCell.h"
#import "MingleChang.h"
#import "MCRootChooseView.h"
#import "MCWebViewController.h"

#define TOOL_CELL_ID @"MCToolCell"
#define WEB_VC_SEGUE_ID @"MCWebViewController"

@interface MCRootViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,MCRootChooseViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet MCRootChooseView *chooseView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)MCSearchBar *searchBar;

@property(nonatomic,strong)UIBarButtonItem *settingBarButtonItem;

@end

@implementation MCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)openTool:(MCTool *)tool{
    MCLOG(@"%@",tool.name);
    [self performSegueWithIdentifier:tool.segueId sender:nil];
}

#pragma mark - Delegate
#pragma mark - CollectionView DataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    MCToolCate *lCate=[MCToolManager manager].toolsInfo[self.chooseView.selectedIndex];
    return lCate.allTools.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCToolCate *lCate=[MCToolManager manager].toolsInfo[self.chooseView.selectedIndex];
    MCTool *lTool=lCate.allTools[row];
    MCToolCell *lCell=[collectionView dequeueReusableCellWithReuseIdentifier:TOOL_CELL_ID forIndexPath:indexPath];
    [lCell setupTool:lTool];
    return lCell;
}
#pragma mark - CollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCToolCate *lCate=[MCToolManager manager].toolsInfo[self.chooseView.selectedIndex];
    MCTool *lTool=lCate.allTools[row];
    [self openTool:lTool];
}
#pragma mark - UICollectionViewFlowLayout Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat side=[MCDevice screenWidth]/4;
    return CGSizeMake(side, side);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}

#pragma mark - UISearchBar Delegate
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.searchBar.showsCancelButton=YES;
    self.navigationItem.rightBarButtonItem=nil;
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.searchBar.showsCancelButton=NO;
    self.navigationItem.rightBarButtonItem=self.settingBarButtonItem;
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.text=@"";
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    NSString *lURLStr=[NSString stringWithFormat:@"http://www.baidu.com/s?wd=%@",searchBar.text];
    [self performSegueWithIdentifier:WEB_VC_SEGUE_ID sender:lURLStr];
    searchBar.text=@"";
}

#pragma mark - RootChooseView Delegate
-(void)rootChooseView:(MCRootChooseView *)chooseView selectedIndex:(NSInteger)index{
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointZero];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:WEB_VC_SEGUE_ID]) {
        MCWebViewController *lViewController=(MCWebViewController *)segue.destinationViewController;
        lViewController.rootURLStr=sender;
    }
}

#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    NSArray *lTitles=[[MCToolManager manager].toolsInfo valueForKey:@"name"];
    [self.chooseView setupAllTitles:lTitles];
}
#pragma mark - Event Response
-(void)settingBarButtonItemClick:(UIBarButtonItem *)sender{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    self.searchBar=[[MCSearchBar alloc]init];
    self.searchBar.delegate=self;
    self.searchBar.placeholder=@"请输入搜索关键字";
    self.searchBar.searchBarStyle=UISearchBarStyleMinimal;
    self.navigationItem.titleView=self.searchBar;
    self.settingBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(settingBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=self.settingBarButtonItem;
}
@end
