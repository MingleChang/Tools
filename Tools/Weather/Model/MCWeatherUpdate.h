//
//  MCWeatherUpdate.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherUpdate : NSObject
@property(nonatomic,strong)NSDate *locDate;
@property(nonatomic,strong)NSDate *utcDate;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
