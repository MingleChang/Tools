//
//  MCMobile.h
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCMobile : NSObject
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *prefix;
@property(nonatomic,copy)NSString *province;
@property(nonatomic,copy)NSString *suit;
@property(nonatomic,copy)NSString *supplier;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

-(NSString *)displayInfo;
@end
