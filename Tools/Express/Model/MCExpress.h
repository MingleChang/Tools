//
//  MCExpress.h
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCExpress : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *code;
-(instancetype)initWithDictionary:(NSDictionary *)dic;

+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array;
@end
