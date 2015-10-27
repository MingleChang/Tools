//
//  MCWeatherWind.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherWind : NSObject
@property(nonatomic,copy)NSString *deg;
@property(nonatomic,copy)NSString *dir;
@property(nonatomic,copy)NSString *sc;
@property(nonatomic,copy)NSString *spd;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
