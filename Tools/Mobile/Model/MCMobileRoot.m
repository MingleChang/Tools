//
//  MCMobileRoot.m
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCMobileRoot.h"
#import "MCMobile.h"
@implementation MCMobileRoot
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"retData"]&&[value isKindOfClass:[NSDictionary class]]) {
        self.mobile=[[MCMobile alloc]initWithDictionary:value];
    }
}
@end
