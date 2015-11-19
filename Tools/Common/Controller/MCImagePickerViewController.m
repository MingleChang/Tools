//
//  MCImagePickerViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/19.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCImagePickerViewController.h"
#import "MingleChang.h"
@interface MCImagePickerViewController ()

@end

@implementation MCImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[MCDrawImage drawImageSize:CGSizeMake(320, 54) withColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
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

@end
