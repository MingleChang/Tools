//
//  MCWeatherHourInfo.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCWeatherWind.h"

@interface MCWeatherHourInfo : NSObject
@property(nonatomic,strong)MCWeatherWind *weatherWind;//风力状况
@property(nonatomic,copy)NSString *date;//当地日期和时间

@property(nonatomic,copy)NSString *hum;//湿度（%）
@property(nonatomic,copy)NSString *pop;//降水概率
@property(nonatomic,copy)NSString *pres;//气压
@property(nonatomic,copy)NSString *tmp;//当前温度
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
