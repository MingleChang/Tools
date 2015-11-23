//
//  MCBirthday.h
//  Tools
//
//  Created by 常峻玮 on 15/11/22.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCDate;
@class FMResultSet;
typedef NS_ENUM(NSInteger,BirthdayType){
    BirthdayTypeSolar=0,
    BirthdayTypeLunar=1,
};

@interface MCBirthday : NSObject
@property(nonatomic,copy)NSString *birthdayId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)MCDate *birthday;
@property(nonatomic,assign)BirthdayType type;

@property(nonatomic,assign)BOOL isSave;

-(instancetype)init;
-(instancetype)initWithDBDictionary:(NSDictionary *)dic;
-(NSDictionary *)toDBDictionary;
-(NSDictionary *)toDBDeleteDictionary;

-(NSString *)displayBirthday;
-(NSString *)displaySolarBirthday;
-(NSString *)displayLunarBirthday;

-(BOOL)isValid;

-(BOOL)save;
-(BOOL)update;
-(BOOL)destroy;

+(NSString *)sqlCreateTable;
+(NSString *)sqlInsert;
+(NSString *)sqlUpdate;
+(NSString *)sqlDelete;
+(NSString *)sqlSelectAll;

+(NSArray *)birthdayArrayByResultSet:(FMResultSet *)resultSet;

@end
