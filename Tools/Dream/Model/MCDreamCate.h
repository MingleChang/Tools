//
//  MCDreamCate.h
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FMResultSet;
@interface MCDreamCate : NSObject
@property(nonatomic,copy)NSString *cateId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *info;

@property(nonatomic,strong,readonly)UIImage *localImage;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(NSString *)selectSQLByAll;
+(NSArray *)cateArrayByResultSet:(FMResultSet *)resultSet;
@end
