//
//  MCWeatherLocationManager.h
//  Tools
//
//  Created by cjw on 15/11/30.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLLocation;
@class MCWeatherArea;
@class MCAddress;

typedef void (^CityIdBlock)(NSString *cityId);

typedef NS_ENUM(NSInteger,LocationMethod){
    LocationMethodDefault,
    LocationMethodIP,
    LocationMethodGPS,
};
@interface MCWeatherLocationManager : NSObject
@property(nonatomic,copy)NSArray *cityList;

+(MCWeatherLocationManager *)manager;
-(void)requestCityId:(CityIdBlock)block;
@end
