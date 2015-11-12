//
//  MCDreamManager.m
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamManager.h"
#import "FMDB.h"
#import "MCDreamCate.h"
#import "MCZGDream.h"

@interface MCDreamManager()

@end

@implementation MCDreamManager
+(MCDreamManager *)maneger{
    static MCDreamManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[MCDreamManager alloc]init];
    });
    return  sharedManager;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        NSString *lDreamDBPath=[[NSBundle mainBundle]pathForResource:@"dream" ofType:@"sqlite"];
        self.dbQueue=[FMDatabaseQueue databaseQueueWithPath:lDreamDBPath];
    }
    return self;
}

-(NSArray *)selectedAllDreamCate{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[MCDreamCate selectSQLByAll]];
        lResultArray=[MCDreamCate cateArrayByResultSet:lResults];
        [lResults close];
    }];
    return lResultArray;
}
-(NSArray *)selectedZGDreamByCateId:(NSString *)cateId{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[MCZGDream selectSQLByCateId:cateId]];
        lResultArray=[MCZGDream dreamArrayByResultSet:lResults];
        [lResults close];
    }];
    return lResultArray;
}
-(NSArray *)selectedZGDreamByKey:(NSString *)key{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[MCZGDream selectSQLByKey:key]];
        lResultArray=[MCZGDream dreamArrayByResultSet:lResults];
        [lResults close];
    }];
    return lResultArray;
}
@end
