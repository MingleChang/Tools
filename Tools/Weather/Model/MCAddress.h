//
//  MCAddress.h
//  Tools
//
//  Created by 常峻玮 on 15/10/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCAddress : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *country;
@property(nonatomic,copy)NSString *province;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *area;
@property(nonatomic,copy)NSString *street;
@property(nonatomic,copy)NSString *number;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
