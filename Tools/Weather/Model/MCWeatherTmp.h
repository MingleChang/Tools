//
//  MCWeatherTmp.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherTmp : NSObject
@property(nonatomic,copy)NSString *max;
@property(nonatomic,copy)NSString *min;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
