//
//  MCWeatherProvince.h
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherProvince : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSArray *weatherCities;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
