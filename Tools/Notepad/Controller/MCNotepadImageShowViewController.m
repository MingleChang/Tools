//
//  MCNotepadImageShowViewController.m
//  Tools
//
//  Created by cjw on 15/11/20.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadImageShowViewController.h"
#import "MCNotepadBigImageCell.h"
#import "MingleChang.h"

#define NOTEPAD_BIGIMAGE_CELL_ID @"MCNotepadBigImageCell"

@interface MCNotepadImageShowViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MCNotepadImageShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    UIImage *lImage=[self.images objectAtIndex:row];
    MCNotepadBigImageCell *lCell=[collectionView dequeueReusableCellWithReuseIdentifier:NOTEPAD_BIGIMAGE_CELL_ID forIndexPath:indexPath];
    [lCell setImage:lImage];
    return lCell;
}
#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
}
#pragma mark - UICollectionView Delegate FlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [MCDevice screenSize];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}
-(void)configureData{
    
}
@end
