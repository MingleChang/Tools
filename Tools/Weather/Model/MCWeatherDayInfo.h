//
//  MCWeatherDayInfo.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCWeatherAstro.h"
#import "MCWeatherCond.h"
#import "MCWeatherTmp.h"
#import "MCWeatherWind.h"

@interface MCWeatherDayInfo : NSObject
@property(nonatomic,strong)MCWeatherAstro *weatherAstro;//天文数值
@property(nonatomic,strong)MCWeatherCond *weatherCond;//天气状况
@property(nonatomic,strong)MCWeatherTmp *weatherTmp;//温度
@property(nonatomic,strong)MCWeatherWind *weatherWind;//风力状况

@property(nonatomic,strong)NSDate *weatherDate;//当地日期

@property(nonatomic,copy)NSString *hum;//湿度（%）
@property(nonatomic,copy)NSString *pcpn;//降雨量（mm）
@property(nonatomic,copy)NSString *pop;//降水概率
@property(nonatomic,copy)NSString *pres;//气压
@property(nonatomic,copy)NSString *vis;//能见度

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
