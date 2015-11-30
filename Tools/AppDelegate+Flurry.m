//
//  AppDelegate+Flurry.m
//  Tools
//
//  Created by 常峻玮 on 15/11/30.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "AppDelegate+Flurry.h"
#import "Flurry.h"

@implementation AppDelegate (Flurry)
-(void)setupFlurry{
    [Flurry setCrashReportingEnabled:YES];
    [Flurry startSession:@"9MN69HS227SWRKSW93D8"];
}
@end
