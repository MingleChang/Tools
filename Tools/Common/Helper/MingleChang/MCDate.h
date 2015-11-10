//
//  MCDate.h
//  Quiz
//
//  Created by cjw on 15/10/14.
//  Copyright © 2015年 hjg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCDate : NSObject
@property(nonatomic,strong)NSDate *date;

@property(nonatomic,assign,readonly)NSInteger year;
@property(nonatomic,assign,readonly)NSInteger month;
@property(nonatomic,assign,readonly)NSInteger day;
@property(nonatomic,assign,readonly)NSInteger hour;
@property(nonatomic,assign,readonly)NSInteger minute;
@property(nonatomic,assign,readonly)NSInteger second;
@property(nonatomic,assign,readonly)NSInteger weekday;
@property(nonatomic,assign,readonly)NSInteger weekdayOrdinal;
@property(nonatomic,assign,readonly)NSInteger weekOfMonth;
@property(nonatomic,assign,readonly)NSInteger weekOfYear;

-(instancetype)initWithInterval:(NSTimeInterval)timestamp;
-(instancetype)initWithDate:(NSDate *)date;
-(instancetype)initWithYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day andHour:(NSInteger)hour andMinute:(NSInteger)minute andSecond:(NSInteger)second;
-(MCDate *)dateAddDays:(NSInteger)days;
-(MCDate *)dateAddMonth:(NSInteger)months;
-(BOOL)isSameDayToDate:(MCDate *)date;
-(BOOL)isSameMonthToDate:(MCDate *)date;
@end
