//
//  MCWeatherTmp.m
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherTmp.h"

@implementation MCWeatherTmp
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString *)displayMax{
    return [NSString stringWithFormat:@"%@°",self.max];
}
-(NSString *)displayMin{
    return [NSString stringWithFormat:@"%@°",self.min];
}
@end
