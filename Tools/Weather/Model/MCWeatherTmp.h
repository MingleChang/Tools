//
//  MCWeatherTmp.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherTmp : NSObject
@property(nonatomic,copy)NSString *max;//最高温度
@property(nonatomic,copy)NSString *min;//最低温度
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
