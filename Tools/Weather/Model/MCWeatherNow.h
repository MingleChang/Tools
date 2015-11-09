//
//  MCWeatherNow.h
//  Tools
//
//  Created by 常峻玮 on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCWeatherAstro.h"
#import "MCWeatherCond.h"
#import "MCWeatherTmp.h"
#import "MCWeatherWind.h"

@interface MCWeatherNow : NSObject
@property(nonatomic,strong)MCWeatherCond *weatherCond;//天气状况
@property(nonatomic,strong)MCWeatherWind *weatherWind;//风力状况

@property(nonatomic,copy)NSString *hum;//湿度（%）
@property(nonatomic,copy)NSString *pcpn;//降雨量（mm）
@property(nonatomic,copy)NSString *pres;//气压
@property(nonatomic,copy)NSString *vis;//能见度(km)
@property(nonatomic,copy)NSString *tmp;//当前温度
@property(nonatomic,copy)NSString *fl;//体感温度

-(instancetype)initWithDictionary:(NSDictionary *)dic;

-(NSString *)displayHum;
-(NSString *)displayTmp;
-(NSString *)displayFl;
@end
