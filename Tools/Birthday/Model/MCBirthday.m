//
//  MCBirthday.m
//  Tools
//
//  Created by 常峻玮 on 15/11/22.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthday.h"
#import "MingleChang.h"
#import "FMDB.h"
#import "MCBirthdayManager.h"

@interface MCBirthday()

@end
@implementation MCBirthday
-(instancetype)init{
    self=[super init];
    if (self) {
        self.birthdayId=[NSUUID UUID].UUIDString;
        self.name=@"";
        self.birthday=[MCDate dateWithYear:1989 month:1 day:1 hour:12 minute:59 second:59];
        self.type=BirthdayTypeSolar;
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
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"birthdayDate"]) {
        self.birthday=[MCDate dateWithInterval:[value doubleValue]];
    }
}
#pragma mark - Public Mothed
-(BOOL)save{
    BOOL isSuccess=[[MCBirthdayManager manager]insertBirthday:self];
    return isSuccess;
}
-(BOOL)update{
    BOOL isSuccess=[[MCBirthdayManager manager]updateBirthday:self];
    return isSuccess;
}
-(BOOL)destroy{
    BOOL isSuccess=[[MCBirthdayManager manager]deleteBirthday:self];
    return isSuccess;
}
#pragma mark - TO DB DIC
-(id)valueForUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"birthdayDate"]) {
        return self.birthday.date;
    }
    return nil;
}
-(NSDictionary *)toDBDictionary{
    return [self dictionaryWithValuesForKeys:[MCBirthday getAllSQLParam]];
}
-(NSDictionary *)toDBDeleteDictionary{
    return [self dictionaryWithValuesForKeys:@[@"birthdayId"]];
}
+(NSArray *)getAllSQLParam{
    return @[@"birthdayId",@"name",@"birthdayDate",@"type"];
}
+(NSArray *)birthdayArrayByResultSet:(FMResultSet *)resultSet{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    while ([resultSet next]) {
        NSDictionary *lResultDic=[resultSet resultDictionary];
        MCBirthday *lBirthday=[[MCBirthday alloc]initWithDBDictionary:lResultDic];
        [lMutableArray addObject:lBirthday];
    }
    return [lMutableArray copy];
}
#pragma mark - SQL String Mothed
+(NSString *)sqlCreateTable{
    NSString *lSQL=@"CREATE TABLE IF NOT EXISTS Birthday (birthdayId text NOT NULL PRIMARY KEY UNIQUE,name text,birthdayDate date,type integer)";
    return lSQL;
}
+(NSString *)sqlInsert{
    NSString *lSQL=@"INSERT INTO Birthday"
    @"(birthdayId,name,birthdayDate,type)"
    @"VALUES (:birthdayId,:name,:birthdayDate,:type)";
    return lSQL;
}
+(NSString *)sqlUpdate{
    NSString *lSQL=@"UPDATE Birthday SET "
    @"birthdayId=:birthdayId,name=:name,birthdayDate=:birthdayDate,type=:type "
    @"WHERE birthdayId=:birthdayId";
    return lSQL;
}
+(NSString *)sqlDelete{
    NSString *lSQL=@"DELETE FROM Birthday WHERE birthdayId=:birthdayId";
    return lSQL;
}
+(NSString *)sqlSelectAll{
    NSString *lSQL=@"SELECT * FROM Birthday";
    return lSQL;
}
@end
