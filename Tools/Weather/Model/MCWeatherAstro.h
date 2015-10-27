//
//  MCWeatherAstro.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherAstro : NSObject
@property(nonatomic,copy)NSString *sr;
@property(nonatomic,copy)NSString *ss;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
