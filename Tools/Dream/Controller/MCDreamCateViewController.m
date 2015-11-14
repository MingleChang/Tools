//
//  MCDreamCateViewController.m
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamCateViewController.h"
#import "MCDreamListViewController.h"
#import "MCDreamCateSearchHeader.h"
#import "MCDreamCateCell.h"
#import "MCDreamManager.h"
#import "MCDreamCate.h"
#import "MingleChang.h"

#define DREAM_CATE_HEADER_ID @"MCDreamCateSearchHeader"
#define DREAM_CATE_CELL_ID @"MCDreamCateCell"

#define DREAM_LIST_VC_SEGUE_ID @"MCDreamListViewController"

@interface MCDreamCateViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MCDreamCateSearchHeaderDelegate>

@property(nonatomic,copy)NSArray *dreamCates;
@end

@implementation MCDreamCateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate
#pragma mark - UICollectionView DataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dreamCates.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCDreamCate *lDreamCate=[self.dreamCates objectAtIndex:row];
    MCDreamCateCell *lCell=[collectionView dequeueReusableCellWithReuseIdentifier:DREAM_CATE_CELL_ID forIndexPath:indexPath];
    [lCell setupDreamCate:lDreamCate];
    return lCell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader] ){
        MCDreamCateSearchHeader *lHeader=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DREAM_CATE_HEADER_ID forIndexPath:indexPath];
        lHeader.delegate=self;
        return lHeader;
    }
    return nil;
}
#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCDreamCate *lDreamCate=[self.dreamCates objectAtIndex:row];
    [self performSegueWithIdentifier:DREAM_LIST_VC_SEGUE_ID sender:lDreamCate];
}
#pragma mark - UICollectionView Delegate FlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 120);
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
    return CGSizeMake(SCREEN_WIDTH, 44);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}
#pragma mark - MCDreamCateSearchHeader Delegate
-(void)dreamCateSearchHeader:(MCDreamCateSearchHeader *)header search:(NSString *)key{
    [self performSegueWithIdentifier:DREAM_LIST_VC_SEGUE_ID sender:key];
}
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:DREAM_LIST_VC_SEGUE_ID]) {
        MCDreamListViewController *lViewConstroller=segue.destinationViewController;
        if ([sender isKindOfClass:[MCDreamCate class]]) {
            lViewConstroller.dreamCate=sender;
        }
        if ([sender isKindOfClass:[NSString class]]) {
            lViewConstroller.searchKey=sender;
        }
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
    self.dreamCates=[[MCDreamManager maneger]selectedAllDreamCate];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"周公解梦";
}
@end
