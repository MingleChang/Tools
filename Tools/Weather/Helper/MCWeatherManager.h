//
//  MCWeatherManager.h
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MCWeatherStatus){
    WeatherStatusPositioning,
    WeatherStatusRequesting,
    WeatherStatusComplete,
};

@interface MCWeatherManager : NSObject

@property(nonatomic,copy)NSArray *cityList;

@property(nonatomic,assign)MCWeatherStatus status;

+(MCWeatherManager *)manager;
-(void)updateWeatherInfo;
@end
