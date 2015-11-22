//
//  MCBirthdayManager.m
//  Tools
//
//  Created by 常峻玮 on 15/11/22.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayManager.h"
#import "FMDB.h"
#import "MCBirthday.h"
#import "MingleChang.h"

#define DIRECTORY_NAME @"Birthday"
#define DB_NAME @"Birthday.db"

#define DIRECTORY_PATH [MCFilePath pathInDocumentWithFileName:DIRECTORY_NAME]

@interface MCBirthdayManager()
@property(nonatomic,strong)FMDatabaseQueue *dbQueue;
@end
@implementation MCBirthdayManager
+(MCBirthdayManager *)manager{
    static MCBirthdayManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager=[[MCBirthdayManager alloc]init];
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
        success=[db executeUpdate:[MCBirthday sqlCreateTable]];
    }];
    return success;
}
-(BOOL)insertBirthday:(MCBirthday *)birthday{
    NSDictionary *lDic=[birthday toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCBirthday sqlInsert] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)updateBirthday:(MCBirthday *)birthday{
    NSDictionary *lDic=[birthday toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCBirthday sqlUpdate] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)deleteBirthday:(MCBirthday *)birthday{
    NSDictionary *lDic=[birthday toDBDeleteDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCBirthday sqlDelete] withParameterDictionary:lDic];
    }];
    return success;
}
-(NSArray *)selectAllBirthday{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[MCBirthday sqlSelectAll]];
        lResultArray=[MCBirthday birthdayArrayByResultSet:lResults];
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
    MCLOG(@"Birthday DB Path:%@",lPath);
    _dbQueue=[[FMDatabaseQueue alloc]initWithPath:lPath];
    return _dbQueue;
}
@end
