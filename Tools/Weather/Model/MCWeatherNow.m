//
//  MCWeatherNow.m
//  Tools
//
//  Created by 常峻玮 on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherNow.h"

@implementation MCWeatherNow
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
