//
//  MCWeatherDayInfo.m
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherDayInfo.h"

@implementation MCWeatherDayInfo
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"astro"]) {
        self.weatherAstro=[[MCWeatherAstro alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"cond"]) {
        self.weatherCond=[[MCWeatherCond alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"tmp"]) {
        self.weatherTmp=[[MCWeatherTmp alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"wind"]) {
        self.weatherWind=[[MCWeatherWind alloc]initWithDictionary:value];
    }
}
@end
