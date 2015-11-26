//
//  MCLotteryRoot.h
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCLotteryRoot : NSObject
@property(nonatomic,assign)NSInteger rows;
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSArray *lotteries;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
