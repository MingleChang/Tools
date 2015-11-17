//
//  MCNotepadManager.m
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadManager.h"
#import "FMDB.h"
#import "MCNotepad.h"
#import "MingleChang.h"

#define DIRECTORY_NAME @"Notepad"
#define DB_NAME @"Notepad.db"

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
        success=[db executeUpdate:[MCNotepad sqlCreateTable]];
    }];
    return success;
}
-(BOOL)insertNotepad:(MCNotepad *)notepad{
    NSDictionary *lDic=[notepad toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCNotepad sqlInsert] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)updateNotepad:(MCNotepad *)notepad{
    NSDictionary *lDic=[notepad toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCNotepad sqlUpdate] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)deleteNotepad:(MCNotepad *)notepad{
    NSDictionary *lDic=[notepad toDBDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[MCNotepad sqlDelete] withParameterDictionary:lDic];
    }];
    return success;
}
-(NSArray *)selectAllNotepad{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[MCNotepad sqlSelectAll]];
        lResultArray=[MCNotepad notepadArrayByResultSet:lResults];
        [lResults close];
    }];
    return lResultArray;
}
#pragma mark - Setter And Getter
-(FMDatabaseQueue *)dbQueue{
    if (_dbQueue) {
        return _dbQueue;
    }
    NSString *lPath=[MCFilePath createDirectory:[MCFilePath pathInDocumentWithFileName:DIRECTORY_NAME]];
    lPath=[MCFilePath pathWithDirectoryPath:lPath andFileName:DB_NAME];
    MCLOG(@"Notepad DB Path:%@",lPath);
    _dbQueue=[[FMDatabaseQueue alloc]initWithPath:lPath];
    return _dbQueue;
}
@end
