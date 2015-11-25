//
//  MCExpress.m
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCExpress.h"

@implementation MCExpress
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array{
    NSMutableArray *lArray=[NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *lDic in array) {
        MCExpress *lExpress=[[MCExpress alloc]initWithDictionary:lDic];
        [lArray addObject:lExpress];
    }
    return [lArray copy];
}
@end
