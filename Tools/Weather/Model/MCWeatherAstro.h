//
//  MCWeatherAstro.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherAstro : NSObject
@property(nonatomic,copy)NSString *sr;//日出时间
@property(nonatomic,copy)NSString *ss;//日落时间
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
