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
#define WEATHER_METHOD_USERDEFAULT @"WeatherMethod"
#define LAST_CITY_ID_USERDEFAULT @"LastCityId"

typedef NS_ENUM(NSInteger,MCWeatherStatus){
    WeatherStatusNone,
    WeatherStatusPositioning,
    WeatherStatusRequesting,
    WeatherStatusComplete,
    WeatherStatusFailed,
};
typedef NS_ENUM(NSInteger,GetWeatherMethod){
    GetWeatherMethodIP,
    GetWeatherMethodLocal,
    GetWeatherMethodSelected,
};

typedef void (^WeatherResultBlock)(MCWeatherStatus status);

@interface MCWeatherManager : NSObject

@property(nonatomic,copy)NSArray *cityList;

@property(nonatomic,assign)MCWeatherStatus status;
@property(nonatomic,assign)GetWeatherMethod method;
@property(nonatomic,copy)NSString *lastCityId;
@property(nonatomic,strong)MCWeatherInfo *weatherInfo;

+(MCWeatherManager *)manager;

-(void)updateWeatherInfo:(WeatherResultBlock)block;
-(void)saveWeatherMethodAndLastCityId;
@end
