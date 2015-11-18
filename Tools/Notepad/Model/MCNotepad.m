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

#define SEPARATED_STR @"@"

@interface MCNotepad()

@end
@implementation MCNotepad
-(instancetype)init{
    self=[super init];
    if (self) {
        self.notepadId=[NSUUID UUID].UUIDString;
        self.content=@"";
        self.images=@[];
        self.imageNames=@[];
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
            self.imageNames=@[];
        }else{
            self.imageNames=[value componentsSeparatedByString:SEPARATED_STR];
        }
    }
    if ([key isEqualToString:@"createTime"]) {
        self.create=[NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
    }
    if ([key isEqualToString:@"updateTime"]) {
        self.modify=[NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
    }
}
#pragma mark - DB Mothed
-(BOOL)save{
    return [[MCNotepadManager manager]insertNotepad:self];
}
-(BOOL)update{
    return [[MCNotepadManager manager]updateNotepad:self];
}
-(BOOL)destroy{
    return [[MCNotepadManager manager]deleteNotepad:self];
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
