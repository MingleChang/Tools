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
    [Flurry startSession:@"DYDGVJWM2BTZXC2W3VZP"];
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
}
void uncaughtExceptionHandler(NSException *exception)
{
    [Flurry logError:@"Uncaught" message:@"Crash!" exception:exception];
}
@end
