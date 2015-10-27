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
@property(nonatomic,strong)MCWeatherAstro *weatherAstro;
@property(nonatomic,strong)MCWeatherCond *weatherCond;
@property(nonatomic,strong)MCWeatherTmp *weatherTmp;
@property(nonatomic,strong)MCWeatherWind *weatherWind;

@property(nonatomic,strong)NSDate *weatherDate;

@property(nonatomic,copy)NSString *hum;
@property(nonatomic,copy)NSString *pcpn;
@property(nonatomic,copy)NSString *pop;
@property(nonatomic,copy)NSString *pres;
@property(nonatomic,copy)NSString *vis;
@property(nonatomic,copy)NSString *tmp;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
