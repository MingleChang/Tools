//
//  MCCate.h
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCToolCate : NSObject
@property(nonatomic,assign)NSInteger cateId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSArray *allTools;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array;
@end
