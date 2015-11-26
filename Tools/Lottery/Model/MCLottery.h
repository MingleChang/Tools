//
//  MCLottery.h
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCLottery : NSObject
@property(nonatomic,copy)NSString *expect;
@property(nonatomic,copy)NSString *opencode;
@property(nonatomic,copy)NSString *opentime;
@property(nonatomic,assign)NSInteger opentimestamp;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array;
@end
