//
//  MCWeatherCond.h
//  Tools
//
//  Created by cjw on 15/10/27.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherCond : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *txt;
@property(nonatomic,copy)NSString *code_d;
@property(nonatomic,copy)NSString *txt_d;
@property(nonatomic,copy)NSString *code_n;
@property(nonatomic,copy)NSString *txt_n;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
