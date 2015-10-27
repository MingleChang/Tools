//
//  MCWeatherInfo.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCWeatherSuggestion.h"
#import "MCWeatherDayInfo.h"
#import "MCWeatherHourInfo.h"
#import "MCWeatherBasic.h"
#import "MCWeatherNow.h"

@interface MCWeatherInfo : NSObject

@property(nonatomic,strong)MCWeatherBasic *weatherBasic;
@property(nonatomic,copy)NSArray *weatherDays;
@property(nonatomic,copy)NSArray *weatherHours;
@property(nonatomic,strong)MCWeatherNow *weatherNow;
@property(nonatomic,strong)MCWeatherSuggestion *weatherSuggestion;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
