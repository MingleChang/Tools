//
//  MCWeatherManager.h
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCWeatherManager : NSObject

@property(nonatomic,copy)NSArray *cityList;

+(MCWeatherManager *)manager;
@end
