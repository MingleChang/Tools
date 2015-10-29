//
//  MCWeatherManager.h
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCWeatherInfo.h"

#define WEATHER_STATUS_CHANGE_NOTIFICATION @"WeatherStatusChangeNotification"

typedef NS_ENUM(NSInteger,MCWeatherStatus){
    WeatherStatusNone,
    WeatherStatusPositioning,
    WeatherStatusRequesting,
    WeatherStatusComplete,
    WeatherStatusFailed,
};

@interface MCWeatherManager : NSObject

@property(nonatomic,copy)NSArray *cityList;

@property(nonatomic,assign)MCWeatherStatus status;

@property(nonatomic,strong)MCWeatherInfo *weatherInfo;

+(MCWeatherManager *)manager;
-(void)updateWeatherInfo;
@end
