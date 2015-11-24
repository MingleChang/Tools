//
//  MCReciprocalDay.h
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCDate;
@class FMResultSet;
@interface MCReciprocalDay : NSObject
@property(nonatomic,copy)NSString *reciprocalDayId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)MCDate *date;

@property(nonatomic,assign)BOOL isSave;

-(instancetype)init;
-(instancetype)initWithDBDictionary:(NSDictionary *)dic;
-(NSDictionary *)toDBDictionary;
-(NSDictionary *)toDBDeleteDictionary;

-(BOOL)isValid;

-(BOOL)save;
-(BOOL)update;
-(BOOL)destroy;

+(NSString *)sqlCreateTable;
+(NSString *)sqlInsert;
+(NSString *)sqlUpdate;
+(NSString *)sqlDelete;
+(NSString *)sqlSelectAll;

+(NSArray *)reciprocalDayArrayByResultSet:(FMResultSet *)resultSet;
@end
