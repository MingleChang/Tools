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

@interface MCNotepadEditViewController ()<UITextViewDelegate>
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
    CGSize lSize=[self.textView sizeThatFits:CGSizeMake(CGRectGetWidth(self.textView.frame), MAXFLOAT)];
    [UIView animateWithDuration:1.0 animations:^{
        self.textViewHeightConstraint.constant=lSize.height;
        [self.textView layoutIfNeeded];
    }];
}
-(void)saveNotepad{
    if (self.notepad.isSave) {
        [self.notepad update];
    }else{
        [self.notepad save];
        [[MCNotepadManager manager].notepadArray addObject:self.notepad];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Delegate
#pragma mark - UITextView Delegate
-(void)textViewDidChange:(UITextView *)textView{
    self.notepad.content=textView.text;
    [self resetTextViewHeight];
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
    self.textView.font=[UIFont systemFontOfSize:20];
    self.textView.placeholderString=@"请输入记事内容";
    self.textView.text=self.notepad.content;
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
}
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender{
    [self saveNotepad];
}
@end
