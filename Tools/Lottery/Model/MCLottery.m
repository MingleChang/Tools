//
//  MCLottery.m
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCLottery.h"

@implementation MCLottery
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
        MCLottery *lLottery=[[MCLottery alloc]initWithDictionary:lDic];
        [lArray addObject:lLottery];
    }
    return [lArray copy];
}
@end
