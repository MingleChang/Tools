//
//  MCDream.h
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;

@interface MCZGDream : NSObject
@property(nonatomic,copy)NSString *dreamId;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *context;
@property(nonatomic,copy)NSString *subcat;
@property(nonatomic,copy)NSString *groups;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(NSString *)selectSQLByCateId:(NSString *)cateId;
+(NSString *)selectSQLByKey:(NSString *)key;
+(NSArray *)dreamArrayByResultSet:(FMResultSet *)resultSet;
@end
