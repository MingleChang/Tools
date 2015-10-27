//
//  MCWeatherSuggestion.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCWeatherIndex.h"

@interface MCWeatherSuggestion : NSObject
@property(nonatomic,strong)MCWeatherIndex *comfIndex;//
@property(nonatomic,strong)MCWeatherIndex *cwIndex;//洗车指数
@property(nonatomic,strong)MCWeatherIndex *drsgIndex;//穿衣指数
@property(nonatomic,strong)MCWeatherIndex *fluIndex;//感冒指数
@property(nonatomic,strong)MCWeatherIndex *sportIndex;//运动指数
@property(nonatomic,strong)MCWeatherIndex *travIndex;//旅游指数
@property(nonatomic,strong)MCWeatherIndex *uvIndex;//紫外线指数
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
