//
//  MCWeatherBasic.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MCWeatherUpdate.h"

@interface MCWeatherBasic : NSObject
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *cnty;
@property(nonatomic,copy)NSString *cityid;
@property(nonatomic,assign)CGFloat lat;
@property(nonatomic,assign)CGFloat lon;

@property(nonatomic,strong)MCWeatherUpdate *updateTime;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
