//
//  AppDelegate+Base.m
//  Tools
//
//  Created by 常峻玮 on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "AppDelegate+Base.h"
#import "MingleChang.h"

@implementation AppDelegate (Base)
-(void)baseSetting{
    [[UINavigationBar appearance] setBackgroundImage:[MCDrawImage drawImageSize:CGSizeMake(320, 54) withColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
@end
