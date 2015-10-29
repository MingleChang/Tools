//
//  MCWeatherUpdate.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherUpdate : NSObject
@property(nonatomic,copy)NSString *loc;//数据更新的当地时间
@property(nonatomic,copy)NSString *utc;//数据更新的UTC时间
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
