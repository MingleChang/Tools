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
@property(nonatomic,strong)MCWeatherWind *weatherWind;
@property(nonatomic,strong)NSDate *dateTime;

@property(nonatomic,copy)NSString *hum;
@property(nonatomic,copy)NSString *pop;
@property(nonatomic,copy)NSString *pres;
@property(nonatomic,copy)NSString *tmp;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
