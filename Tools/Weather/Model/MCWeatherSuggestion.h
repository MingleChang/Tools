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
@property(nonatomic,strong)MCWeatherIndex *comfIndex;
@property(nonatomic,strong)MCWeatherIndex *cwIndex;
@property(nonatomic,strong)MCWeatherIndex *drsgIndex;
@property(nonatomic,strong)MCWeatherIndex *fluIndex;
@property(nonatomic,strong)MCWeatherIndex *sportIndex;
@property(nonatomic,strong)MCWeatherIndex *travIndex;
@property(nonatomic,strong)MCWeatherIndex *uvIndex;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
