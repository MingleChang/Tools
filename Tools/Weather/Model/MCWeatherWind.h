//
//  MCWeatherWind.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherWind : NSObject
@property(nonatomic,copy)NSString *deg;//风向（角度）
@property(nonatomic,copy)NSString *dir;//风向（方向）
@property(nonatomic,copy)NSString *sc;//风力等级
@property(nonatomic,copy)NSString *spd;//风速
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
