//
//  MCViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/10/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCViewController.h"

@interface MCViewController ()

@end

@implementation MCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetNavigationBarItems];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self resetNavigationBar];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Base Motheds
-(void)resetNavigationBar{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)resetNavigationBarItems{
    UIBarButtonItem *lBackBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem=lBackBarButtonItem;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Event Response
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
