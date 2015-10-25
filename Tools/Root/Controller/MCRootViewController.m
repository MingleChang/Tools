//
//  MCRootViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/10/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCRootViewController.h"

@interface MCRootViewController ()

@end

@implementation MCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDataAsset *lDataAsset=[[NSDataAsset alloc]initWithName:@"city"];
    NSString *lString=[[NSString alloc]initWithData:lDataAsset.data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",lString);
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
