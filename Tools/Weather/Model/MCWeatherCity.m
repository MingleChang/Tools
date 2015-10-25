//
//  MCWeatherCity.m
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherCity.h"
#import "MCWeatherArea.h"

@implementation MCWeatherCity
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"areas"]&&[value isKindOfClass:[NSArray class]]) {
        [self setupWeatherAreas:value];
    }
}
-(void)setupWeatherAreas:(NSArray *)weatherAreas{
    NSMutableArray *lAreas=[NSMutableArray arrayWithCapacity:weatherAreas.count];
    for (NSDictionary *dic in weatherAreas) {
        MCWeatherArea *lArea=[[MCWeatherArea alloc]initWithDictionary:dic];
        [lAreas addObject:lArea];
    }
    self.weatherAreas=lAreas;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@=>Areas:%@",self.name,self.weatherAreas];
}
@end
