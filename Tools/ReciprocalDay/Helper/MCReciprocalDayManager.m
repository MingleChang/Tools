//
//  MCReciprocalDayManager.m
//  Tools
//
//  Created by 常峻玮 on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCReciprocalDayManager.h"
#import "FMDB.h"
#import "MCReciprocalDay.h"
#import "MingleChang.h"

#define DIRECTORY_NAME @"ReciprocalDay"
#define DB_NAME @"ReciprocalDay.db"

#define DIRECTORY_PATH [MCFilePath pathInDocumentWithFileName:DIRECTORY_NAME]

@interface MCReciprocalDayManager()
@property(nonatomic,strong)FMDatabaseQueue *dbQueue;
@end

@implementation MCReciprocalDayManager
+(MCReciprocalDayManager *)manager{
    static MCReciprocalDayManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager=[[MCReciprocalDayManager alloc]init];
    });
    return sharedManager;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        [self createTable];
    }
    return self;
}
#pragma mark - SQL
-(BOOL)createTable{
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCReciprocalDay sqlCreateTable]];
    }];
    return success;
}
-(BOOL)insertReciprocalDay:(MCReciprocalDay *)reciprocalDay{
    NSDictionary *lDic=[reciprocalDay toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCReciprocalDay sqlInsert] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)updateReciprocalDay:(MCReciprocalDay *)reciprocalDay{
    NSDictionary *lDic=[reciprocalDay toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCReciprocalDay sqlUpdate] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)deleteReciprocalDay:(MCReciprocalDay *)reciprocalDay{
    NSDictionary *lDic=[reciprocalDay toDBDeleteDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCReciprocalDay sqlDelete] withParameterDictionary:lDic];
    }];
    return success;
}
-(NSArray *)selectAllReciprocalDay{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[MCReciprocalDay sqlSelectAll]];
        lResultArray=[MCReciprocalDay reciprocalDayArrayByResultSet:lResults];
        [lResults close];
    }];
    return lResultArray;
}
#pragma mark - Setter And Getter
-(FMDatabaseQueue *)dbQueue{
    if (_dbQueue) {
        return _dbQueue;
    }
    NSString *lPath=[MCFilePath createDirectory:DIRECTORY_PATH];
    lPath=[MCFilePath pathWithDirectoryPath:lPath andFileName:DB_NAME];
    MCLOG(@"reciprocalDay DB Path:%@",lPath);
    _dbQueue=[[FMDatabaseQueue alloc]initWithPath:lPath];
    return _dbQueue;
}
@end
