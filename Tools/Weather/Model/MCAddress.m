//
//  MCAddress.m
//  Tools
//
//  Created by 常峻玮 on 15/10/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCAddress.h"

@implementation MCAddress
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
