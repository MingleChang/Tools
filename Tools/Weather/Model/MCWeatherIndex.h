//
//  MCWeatherIndex.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherIndex : NSObject
@property(nonatomic,copy)NSString *brf;//指数简介
@property(nonatomic,copy)NSString *txt;//指数详情
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
