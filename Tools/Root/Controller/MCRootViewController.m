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

#define TOOL_CELL_ID @"MCToolCell"

@interface MCRootViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,MCRootChooseViewDelegate>
@property (weak, nonatomic) IBOutlet MCRootChooseView *chooseView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

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
#pragma mark - RootChooseView Delegate
-(void)rootChooseView:(MCRootChooseView *)chooseView selectedIndex:(NSInteger)index{
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointZero];
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
#pragma mark - Override
-(void)resetNavigationItem{
//    UISearchBar *lSearchBar=[[UISearchBar alloc]init];
//    lSearchBar.searchBarStyle=UISearchBarStyleMinimal;
//    self.navigationItem.titleView=lSearchBar;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
