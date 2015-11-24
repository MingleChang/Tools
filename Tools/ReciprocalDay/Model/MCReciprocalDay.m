//
//  MCReciprocalDay.m
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCReciprocalDay.h"
#import "MingleChang.h"
#import "FMDB.h"
#import "MCReciprocalDayManager.h"

@implementation MCReciprocalDay
-(instancetype)init{
    self=[super init];
    if (self) {
        self.reciprocalDayId=[NSUUID UUID].UUIDString;
        self.name=@"";
        self.date=[MCDate dateWithYear:2000 month:1 day:1 hour:12 minute:59 second:59];
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
    if ([key isEqualToString:@"reciprocalDayDate"]) {
        self.date=[MCDate dateWithInterval:[value doubleValue]];
    }
}
#pragma mark - Public Mothed
-(BOOL)isValid{
    if (self.name.length==0) {
        return NO;
    }
    return YES;
}
-(BOOL)save{
    BOOL isSuccess=[[MCReciprocalDayManager manager]insertReciprocalDay:self];
    self.isSave=isSuccess;
    return isSuccess;
}
-(BOOL)update{
    BOOL isSuccess=[[MCReciprocalDayManager manager]updateReciprocalDay:self];
    return isSuccess;
}
-(BOOL)destroy{
    BOOL isSuccess=[[MCReciprocalDayManager manager]deleteReciprocalDay:self];
    return isSuccess;
}
#pragma mark - TO DB DIC
-(id)valueForUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"reciprocalDayDate"]) {
        return self.date.date;
    }
    return nil;
}
-(NSDictionary *)toDBDictionary{
    return [self dictionaryWithValuesForKeys:[MCReciprocalDay getAllSQLParam]];
}
-(NSDictionary *)toDBDeleteDictionary{
    return [self dictionaryWithValuesForKeys:@[@"reciprocalDayId"]];
}
+(NSArray *)getAllSQLParam{
    return @[@"reciprocalDayId",@"name",@"reciprocalDayDate"];
}
+(NSArray *)reciprocalDayArrayByResultSet:(FMResultSet *)resultSet{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    while ([resultSet next]) {
        NSDictionary *lResultDic=[resultSet resultDictionary];
        MCReciprocalDay *lReciprocalDay=[[MCReciprocalDay alloc]initWithDBDictionary:lResultDic];
        [lMutableArray addObject:lReciprocalDay];
    }
    return [lMutableArray copy];
}
#pragma mark - SQL String Mothed
+(NSString *)sqlCreateTable{
    NSString *lSQL=@"CREATE TABLE IF NOT EXISTS ReciprocalDay (reciprocalDayId text NOT NULL PRIMARY KEY UNIQUE,name text,reciprocalDayDate date)";
    return lSQL;
}
+(NSString *)sqlInsert{
    NSString *lSQL=@"INSERT INTO ReciprocalDay"
    @"(reciprocalDayId,name,reciprocalDayDate)"
    @"VALUES (:reciprocalDayId,:name,:reciprocalDayDate)";
    return lSQL;
}
+(NSString *)sqlUpdate{
    NSString *lSQL=@"UPDATE ReciprocalDay SET "
    @"reciprocalDayId=:reciprocalDayId,name=:name,reciprocalDayDate=:reciprocalDayDate "
    @"WHERE reciprocalDayId=:reciprocalDayId";
    return lSQL;
}
+(NSString *)sqlDelete{
    NSString *lSQL=@"DELETE FROM ReciprocalDay WHERE reciprocalDayId=:reciprocalDayId";
    return lSQL;
}
+(NSString *)sqlSelectAll{
    NSString *lSQL=@"SELECT * FROM ReciprocalDay";
    return lSQL;
}
@end
