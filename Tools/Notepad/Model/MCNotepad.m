//
//  MCNotepad.m
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepad.h"
#import "MCNotepadManager.h"
#import "FMDB.h"
#import "MingleChang.h"
#import "MCFilePath.h"

#define SEPARATED_STR @"@"

#define DIRECTORY_NAME @"Notepad"
#define DB_NAME @"Notepad.db"

#define DIRECTORY_PATH [MCFilePath pathInDocumentWithFileName:DIRECTORY_NAME]

@interface MCNotepad()

@end
@implementation MCNotepad
-(instancetype)init{
    self=[super init];
    if (self) {
        self.notepadId=[NSUUID UUID].UUIDString;
        self.content=@"";
        self.imageNames=[NSMutableArray array];
        self.create=[NSDate date];
        self.modify=[NSDate date];
        self.isSave=NO;
    }
    return self;
}
-(instancetype)initWithDBDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        self.isSave=YES;
    }
    return self;
}
-(BOOL)isValid{
    if (self.content.length==0&&self.imageNames.count==0) {
        return NO;
    }
    return YES;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"imageName"]&&[value isKindOfClass:[NSString class]]) {
        NSString *lValueStr=(NSString *)value;
        if (lValueStr.length==0) {
            self.imageNames=[NSMutableArray array];
        }else{
            self.imageNames=[[value componentsSeparatedByString:SEPARATED_STR]mutableCopy];
        }
    }
    if ([key isEqualToString:@"createTime"]) {
        self.create=[NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
    }
    if ([key isEqualToString:@"updateTime"]) {
        self.modify=[NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
    }
}
#pragma mark - Setter And Getter
-(NSMutableArray *)images{
    if (_images) {
        return _images;
    }
    _images=[NSMutableArray array];
    for (NSString *lString in self.imageNames) {
        UIImage *lImage=[UIImage imageWithContentsOfFile:[DIRECTORY_PATH stringByAppendingPathComponent:lString]];
        [_images addObject:lImage];
    }
    return _images;
}

#pragma mark - Public Mothed
-(void)deleteImageWithIndex:(NSInteger)index{
    if (index>=self.imageNames.count) {
        return;
    }
    NSString *lString=[self.imageNames objectAtIndex:index];
    [self.imageNames removeObjectAtIndex:index];
    [self.images removeObjectAtIndex:index];
    NSString *lImagePath=[DIRECTORY_PATH stringByAppendingPathComponent:lString];
    [[NSFileManager defaultManager]removeItemAtPath:lImagePath error:nil];
}
-(NSString *)displayContent{
    if (self.content.length==0) {
        return @"时间记事";
    }
    return self.content;
}
#pragma mark - DB Mothed
-(BOOL)save{
    BOOL isSuccess=[[MCNotepadManager manager]insertNotepad:self];
    if (isSuccess==NO) {
        return NO;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<self.images.count; i++) {
            NSString *lString=[self.imageNames objectAtIndex:i];
            NSString *lImagePath=[DIRECTORY_PATH stringByAppendingPathComponent:lString];
            if ([[NSFileManager defaultManager]fileExistsAtPath:lImagePath]) {
                continue;
            }
            UIImage *lImage=[self.images objectAtIndex:i];
            NSData *lData=UIImagePNGRepresentation(lImage);
            [lData writeToFile:lImagePath atomically:YES];
        }
    });
    self.isSave=YES;
    return YES;
}
-(BOOL)update{
    BOOL isSuccess= [[MCNotepadManager manager]updateNotepad:self];
    if (isSuccess==NO) {
        return NO;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<self.images.count; i++) {
            NSString *lString=[self.imageNames objectAtIndex:i];
            NSString *lImagePath=[DIRECTORY_PATH stringByAppendingPathComponent:lString];
            if ([[NSFileManager defaultManager]fileExistsAtPath:lImagePath]) {
                continue;
            }
            UIImage *lImage=[self.images objectAtIndex:i];
            NSData *lData=UIImagePNGRepresentation(lImage);
            [lData writeToFile:lImagePath atomically:YES];
        }
    });
    return YES;
}
-(BOOL)destroy{
    BOOL isSuccess=[[MCNotepadManager manager]deleteNotepad:self];
    if (isSuccess==NO) {
        return NO;
    }
    NSInteger count=self.images.count;
    for (int i=0; i<count; i++) {
        [self deleteImageWithIndex:i];
    }
    return YES;
}
#pragma mark - TO DB DIC
-(id)valueForUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"imageName"]) {
        return [self.imageNames componentsJoinedByString:SEPARATED_STR];
    }
    if ([key isEqualToString:@"createTime"]) {
        return self.create;
    }
    if ([key isEqualToString:@"updateTime"]) {
        return self.modify;
    }
    return nil;
}
-(NSDictionary *)toDBDictionary{
    return [self dictionaryWithValuesForKeys:[MCNotepad getAllSQLParam]];
}
+(NSArray *)getAllSQLParam{
    return @[@"notepadId",@"content",@"imageName",@"createTime",@"updateTime"];
}
+(NSArray *)notepadArrayByResultSet:(FMResultSet *)resultSet{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    while ([resultSet next]) {
        NSDictionary *lResultDic=[resultSet resultDictionary];
        MCNotepad *lNotepad=[[MCNotepad alloc]initWithDBDictionary:lResultDic];
        [lMutableArray addObject:lNotepad];
    }
    return [lMutableArray copy];
}
#pragma mark - SQL String Mothed
+(NSString *)sqlCreateTable{
    NSString *lSQL=@"CREATE TABLE IF NOT EXISTS Notepad (notepadId text NOT NULL PRIMARY KEY UNIQUE,content text,imageName text,createTime datetime,updateTime datetime)";
    return lSQL;
}
+(NSString *)sqlInsert{
    NSString *lSQL=@"INSERT INTO Notepad"
    @"(notepadId,content,imageName,createTime,updateTime)"
    @"VALUES (:notepadId,:content,:imageName,:createTime,:updateTime)";
    return lSQL;
}
+(NSString *)sqlUpdate{
    NSString *lSQL=@"UPDATE Notepad SET "
    @"notepadId=:notepadId,content=:content,imageName=:imageName,createTime=:createTime,updateTime=:updateTime "
    @"WHERE notepadId=:notepadId";
    return lSQL;
}
+(NSString *)sqlDelete{
    NSString *lSQL=@"DELETE FROM Notepad WHERE notepadId=:notepadId";
    return lSQL;
}
+(NSString *)sqlSelectAll{
    NSString *lSQL=@"SELECT * FROM Notepad";
    return lSQL;
}
@end
