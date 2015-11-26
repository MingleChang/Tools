//
//  MCLotteryRoot.m
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCLotteryRoot.h"
#import "MCLottery.h"

@implementation MCLotteryRoot
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"data"]&&[value isKindOfClass:[NSArray class]]) {
        self.lotteries=[MCLottery arrayModelByArrayOfDictionary:value];
    }
}
@end
