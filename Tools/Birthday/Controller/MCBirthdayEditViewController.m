//
//  MCBirthdayEditViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayEditViewController.h"

@interface MCBirthdayEditViewController ()

@end

@implementation MCBirthdayEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
}
@end
