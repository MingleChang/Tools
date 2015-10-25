//
//  MCWeatherArea.m
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherArea.h"

@implementation MCWeatherArea
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@=>%@",self.name,self.identity];
}
@end
