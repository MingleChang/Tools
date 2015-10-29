//
//  MCWeatherInfo.m
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherInfo.h"

@implementation MCWeatherInfo
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"basic"]) {
        self.weatherBasic=[[MCWeatherBasic alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"now"]) {
        self.weatherNow=[[MCWeatherNow alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"daily_forecast"]) {
        NSArray *lArray=(NSArray *)value;
        NSMutableArray *lWeatherDays=[NSMutableArray arrayWithCapacity:lArray.count];
        for (NSDictionary *lDic in lArray) {
            MCWeatherDayInfo *lDay=[[MCWeatherDayInfo alloc]initWithDictionary:lDic];
            [lWeatherDays addObject:lDay];
        }
        self.weatherDays=lWeatherDays;
    }
    if ([key isEqualToString:@"hourly_forecast"]) {
        NSArray *lArray=(NSArray *)value;
        NSMutableArray *lWeatherHours=[NSMutableArray arrayWithCapacity:lArray.count];
        for (NSDictionary *lDic in lArray) {
            MCWeatherHourInfo *lHour=[[MCWeatherHourInfo alloc]initWithDictionary:lDic];
            [lWeatherHours addObject:lHour];
        }
        self.weatherHours=lWeatherHours;
    }
    if ([key isEqualToString:@"suggestion"]) {
        self.weatherSuggestion=[[MCWeatherSuggestion alloc]initWithDictionary:value];
    }
}
@end
