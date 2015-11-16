//
//  MCNotepadManager.m
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadManager.h"
#import "FMDB.h"
@interface MCNotepadManager()
@property(nonatomic,strong)FMDatabaseQueue *dbQueue;
@end
@implementation MCNotepadManager
+(MCNotepadManager *)manager{
    static MCNotepadManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager=[[MCNotepadManager alloc]init];
    });
    return sharedManager;
}
@end
