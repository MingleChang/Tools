//
//  MCToolManager.m
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCToolManager.h"
#import "MCToolCate.h"
#import "MCTool.h"

@implementation MCToolManager
+(MCToolManager *)manager{
    static MCToolManager *managerInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance=[[MCToolManager alloc]init];
    });
    return managerInstance;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        [self readLocalToolInfo];
    }
    return self;
}
-(void)readLocalToolInfo{
    NSString *lPath=[[NSBundle mainBundle]pathForResource:@"tools" ofType:@"json"];
    NSData *lData=[NSData dataWithContentsOfFile:lPath];
    NSArray *lArray=[NSJSONSerialization JSONObjectWithData:lData options:NSJSONReadingAllowFragments error:nil];
    self.toolsInfo=[MCToolCate arrayModelByArrayOfDictionary:lArray];
}
@end
