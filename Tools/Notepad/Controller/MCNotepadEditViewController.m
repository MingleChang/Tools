//
//  MCNotepadEditViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/17.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadEditViewController.h"
#import "MCTextView.h"
#import "MingleChang.h"
#import "MCNotepad.h"
#import "MCNotepadManager.h"
#import "MCNotepadImageCell.h"
#import "MCNotepadImageShowViewController.h"

#define NOTEPAD_IMAGE_CELL_ID @"MCNotepadImageCell"

#define NOTEPAD_IMAGE_SHOW_VC_SEGUE_ID @"MCNotepadImageShowViewController"

#define TEXTVIEW_WIDTH (SCREEN_WIDTH-20)
#define COLLECTIONVIEW_WIDTH (SCREEN_WIDTH-20)

@interface MCNotepadEditViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MCNotepadImageCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightConstraint;
@property (weak, nonatomic) IBOutlet MCTextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;

@end

@implementation MCNotepadEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self resetTextViewHeight];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Mothed
-(void)resetTextViewHeight{
    CGSize lSize=[self.textView sizeThatFits:CGSizeMake(TEXTVIEW_WIDTH, MAXFLOAT)];
    [UIView animateWithDuration:1.0 animations:^{
        self.textViewHeightConstraint.constant=lSize.height;
        [self.textView layoutIfNeeded];
    }];
}
-(void)saveNotepad{
    if (self.notepad.isSave) {
        if ([self.notepad isValid]) {
            [self.notepad update];
        }else{
            [self.notepad destroy];
            [[MCNotepadManager manager].notepadArray removeObject:self.notepad];
        }
    }else{
        if ([self.notepad isValid]) {
            [self.notepad save];
            [[MCNotepadManager manager].notepadArray addObject:self.notepad];
        }else{
            
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)resetCollectionView{
    if (self.notepad.images.count==0) {
        self.collectionViewHeightConstraint.constant=0;
    }else if (self.notepad.images.count==1){
        self.collectionViewHeightConstraint.constant=COLLECTIONVIEW_WIDTH/3*2;
    }else if (self.notepad.images.count==2){
        self.collectionViewHeightConstraint.constant=COLLECTIONVIEW_WIDTH/2;
    }else{
        self.collectionViewHeightConstraint.constant=COLLECTIONVIEW_WIDTH/3;
    }
    [self.collectionView reloadData];
}
#pragma mark - Delegate
#pragma mark - UITextView Delegate
-(void)textViewDidChange:(UITextView *)textView{
    self.notepad.content=textView.text;
    [self resetTextViewHeight];
}
#pragma mark - UIImagePickerController Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *lImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    [self.notepad.images addObject:lImage];
    [self.notepad.imageNames addObject:[NSUUID UUID].UUIDString];
    [self resetCollectionView];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.notepad.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    UIImage *lImage=self.notepad.images[row];
    MCNotepadImageCell *lCell=[collectionView dequeueReusableCellWithReuseIdentifier:NOTEPAD_IMAGE_CELL_ID forIndexPath:indexPath];
    lCell.delegate=self;
    [lCell setNotepadImage:lImage];
    return lCell;
}
#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:NOTEPAD_IMAGE_SHOW_VC_SEGUE_ID sender:indexPath];
}
#pragma mark - UICollectionView Delegate FlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.notepad.images.count==0) {
        return CGSizeZero;
    }else if (self.notepad.images.count==1){
        return CGSizeMake(COLLECTIONVIEW_WIDTH, COLLECTIONVIEW_WIDTH/3*2);
    }else if (self.notepad.images.count==2){
        return CGSizeMake(COLLECTIONVIEW_WIDTH/2, COLLECTIONVIEW_WIDTH/2);
    }else{
        return CGSizeMake(COLLECTIONVIEW_WIDTH/3, COLLECTIONVIEW_WIDTH/3);
    }
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
#pragma mark - MCNotepadImageCell Delegate
-(void)notepadImageCellDeleteButtonClick:(MCNotepadImageCell *)cell{
    NSIndexPath *indexPath=[self.collectionView indexPathForCell:cell];
    NSInteger row=[indexPath row];
    [self.notepad deleteImageWithIndex:row];
    [self resetCollectionView];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:NOTEPAD_IMAGE_SHOW_VC_SEGUE_ID]) {
        MCNotepadImageShowViewController *lViewController=(MCNotepadImageShowViewController *)segue.destinationViewController;
        lViewController.images=self.notepad.images;
        lViewController.index=[sender row];
    }
}

#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.textView.font=[UIFont systemFontOfSize:18];
    self.textView.placeholderString=@"请输入记事内容";
    self.textView.text=self.notepad.content;
    CGSize lSize=[self.textView sizeThatFits:CGSizeMake(TEXTVIEW_WIDTH, MAXFLOAT)];
    self.textViewHeightConstraint.constant=lSize.height;
}
-(void)configureData{
    [self resetCollectionView];
}

#pragma mark - Event Response
-(void)cameraBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.textView resignFirstResponder];
    UIAlertController *lAlertController=[UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *lAlbumAction=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *lViewController=[[UIImagePickerController alloc]init];
        lViewController.delegate=self;
        [self.navigationController presentViewController:lViewController animated:YES completion:nil];
    }];
    [lAlertController addAction:lAlbumAction];
    UIAlertAction *lCameraAction=[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *lViewController=[[UIImagePickerController alloc]init];
        lViewController.delegate=self;
        lViewController.sourceType=UIImagePickerControllerSourceTypeCamera;
        [self.navigationController presentViewController:lViewController animated:YES completion:nil];
    }];
    [lAlertController addAction:lCameraAction];
    UIAlertAction *lCancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [lAlertController addAction:lCancelAction];
    [self presentViewController:lAlertController animated:YES completion:nil];
}
-(void)trashBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.textView resignFirstResponder];
    UIAlertController *lAlertController=[UIAlertController alertControllerWithTitle:@"删除记事?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *lCancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [lAlertController addAction:lCancelAction];
    UIAlertAction *lOKAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (self.notepad.isSave) {
            [self.notepad destroy];
            [[MCNotepadManager manager].notepadArray removeObject:self.notepad];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [lAlertController addAction:lOKAction];
    [self presentViewController:lAlertController animated:YES completion:nil];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    
    UIBarButtonItem *lCameraBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_camera"] style:UIBarButtonItemStyleDone target:self action:@selector(cameraBarButtonItemClick:)];
    UIBarButtonItem *lTrashBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_trash"] style:UIBarButtonItemStyleDone target:self action:@selector(trashBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItems=@[lCameraBarButtonItem,lTrashBarButtonItem];
}
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender{
    [self saveNotepad];
}
@end
