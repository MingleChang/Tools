//
//  MCWeatherWind.m
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherWind.h"

@implementation MCWeatherWind
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString *)displaySc{
    return [NSString stringWithFormat:@"%@级",self.sc];
}
@end
