//
//  MCWeatherCond.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherCond : NSObject
@property(nonatomic,copy)NSString *code;//天气代码
@property(nonatomic,copy)NSString *txt;//天气描述
@property(nonatomic,copy)NSString *code_d;//白天天气代码
@property(nonatomic,copy)NSString *txt_d;//白天天气描述
@property(nonatomic,copy)NSString *code_n;//晚上天气代码
@property(nonatomic,copy)NSString *txt_n;//晚上天气描述
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
