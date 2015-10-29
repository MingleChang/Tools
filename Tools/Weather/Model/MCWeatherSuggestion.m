//
//  MCWeatherSuggestion.m
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherSuggestion.h"

@implementation MCWeatherSuggestion
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"comf"]) {
        self.comfIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"cw"]) {
        self.cwIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"drsg"]) {
        self.drsgIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"flu"]) {
        self.fluIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"sport"]) {
        self.sportIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"trav"]) {
        self.travIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:@"uv"]) {
        self.uvIndex=[[MCWeatherIndex alloc]initWithDictionary:value];
    }
}
@end
