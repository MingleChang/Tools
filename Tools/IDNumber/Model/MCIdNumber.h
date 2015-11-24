//
//  MCIdNumber.h
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCIdNumber : NSObject
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *birthday;
@property(nonatomic,copy)NSString *sex;
-(instancetype)initWithDictionary:(NSDictionary *)dic;

-(NSString *)displayInfo;
@end
