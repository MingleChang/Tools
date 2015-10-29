//
//  MCWeatherBasic.m
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherBasic.h"

@implementation MCWeatherBasic
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.cityid=value;
    }
    if ([key isEqualToString:@"update"]) {
        self.updateTime=[[MCWeatherUpdate alloc]initWithDictionary:value];
    }
}
@end
