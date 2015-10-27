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
@property(nonatomic,copy)NSString *city;//城市名称
@property(nonatomic,copy)NSString *cnty;//国家名称
@property(nonatomic,copy)NSString *cityid;//id 城市id
@property(nonatomic,assign)CGFloat lat;//纬度
@property(nonatomic,assign)CGFloat lon;//经度

@property(nonatomic,strong)MCWeatherUpdate *updateTime;//数据更新时间，24小时制

-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
