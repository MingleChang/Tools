//
//  MCNotepadViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/14.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadViewController.h"
#import "MCNotepadManager.h"
#import "MCNotepad.h"
#import "MCNotepadEditViewController.h"

#define NOTEPAD_EDIT_VC_SEGUE_ID @"MCNotepadEditViewController"

@interface MCNotepadViewController ()

@end

@implementation MCNotepadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response
-(void)addBarButtonItemClick:(UIBarButtonItem *)sender{
    [self performSegueWithIdentifier:NOTEPAD_EDIT_VC_SEGUE_ID sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"记事本";
    UIBarButtonItem *lAddBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(addBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=lAddBarButtonItem;
}
@end
