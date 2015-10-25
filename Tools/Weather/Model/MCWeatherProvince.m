//
//  MCWeatherProvince.m
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherProvince.h"
#import "MCWeatherCity.h"
@implementation MCWeatherProvince
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"cities"]&&[value isKindOfClass:[NSArray class]]) {
        [self setupWeatherCities:value];
    }
}
-(void)setupWeatherCities:(NSArray *)weatherCities{
    NSMutableArray *lCities=[NSMutableArray arrayWithCapacity:weatherCities.count];
    for (NSDictionary *dic in weatherCities) {
        MCWeatherCity *lCity=[[MCWeatherCity alloc]initWithDictionary:dic];
        [lCities addObject:lCity];
    }
    self.weatherCities=lCities;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@=>Citis:%@",self.name,self.weatherCities];
}
@end
