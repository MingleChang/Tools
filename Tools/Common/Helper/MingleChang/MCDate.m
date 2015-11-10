//
//  MCDate.m
//  Quiz
//
//  Created by cjw on 15/10/14.
//  Copyright © 2015年 hjg. All rights reserved.
//

#import "MCDate.h"

@interface MCDate ()

@property(nonatomic,strong)NSDateComponents *dateComponent;
@property(nonatomic,strong,readonly)NSCalendar *calendar;

@end

@implementation MCDate
-(instancetype)initWithInterval:(NSTimeInterval)timestamp{
    self=[super init];
    if (self) {
        self.date=[NSDate dateWithTimeIntervalSince1970:timestamp];
    }
    return self;
}
-(instancetype)initWithDate:(NSDate *)date{
    self=[super init];
    if (self) {
        self.date=date;
    }
    return self;
}
-(instancetype)initWithYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day andHour:(NSInteger)hour andMinute:(NSInteger)minute andSecond:(NSInteger)second{
    self=[super init];
    if (self) {
        self.date=[self.calendar dateWithEra:1 year:year month:month day:day hour:hour minute:minute second:second nanosecond:0];
    }
    return self;
}
#pragma mark - Public Motheds
-(MCDate *)dateAddDays:(NSInteger)days{
    NSDateComponents *lDateComponets=[self.dateComponent copy];
    lDateComponets.day=lDateComponets.day+days;
    MCDate *lDate=[[MCDate alloc]init];
    lDate.date=[self.calendar dateFromComponents:lDateComponets];
    return lDate;
}
-(MCDate *)dateAddMonth:(NSInteger)months{
    NSDateComponents *lDateComponets=[self.dateComponent copy];
    lDateComponets.month=lDateComponets.month+months;
    MCDate *lDate=[[MCDate alloc]init];
    lDate.date=[self.calendar dateFromComponents:lDateComponets];
    return lDate;
}
-(BOOL)isSameDayToDate:(MCDate *)date{
    if (self.year==date.year&&self.month==date.month&&self.day==date.day) {
        return YES;
    }else{
        return NO;
    }
}
-(BOOL)isSameMonthToDate:(MCDate *)date{
    if (self.year==date.year&&self.month==date.month) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - Setter And Getter
-(NSInteger)year{
    return self.dateComponent.year;
}
-(NSInteger)month{
    return self.dateComponent.month;
}
-(NSInteger)day{
    return self.dateComponent.day;
}
-(NSInteger)hour{
    return self.dateComponent.hour;
}
-(NSInteger)weekday{
    return self.dateComponent.weekday;
}
-(NSInteger)weekdayOrdinal{
    return self.dateComponent.weekdayOrdinal;
}
-(NSInteger)weekOfMonth{
    return self.dateComponent.weekOfMonth;
}
-(NSInteger)weekOfYear{
    return self.dateComponent.weekOfYear;
}
-(NSDate *)date{
    if (_date==nil) {
        _date=[NSDate date];
    }
    return _date;
}
-(NSDateComponents *)dateComponent{
    if (_dateComponent==nil||(![[self.calendar dateFromComponents:_dateComponent]isEqualToDate:self.date])) {
        _dateComponent=[self.calendar components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal|NSCalendarUnitQuarter|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekOfYear|NSCalendarUnitYearForWeekOfYear|NSCalendarUnitNanosecond|NSCalendarUnitCalendar|NSCalendarUnitTimeZone fromDate:self.date];
    }
    return _dateComponent;
}
-(NSCalendar *)calendar{
    return [NSCalendar currentCalendar];
}
@end
