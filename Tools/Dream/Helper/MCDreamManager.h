//
//  MCDreamManager.h
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabaseQueue;
@interface MCDreamManager : NSObject
@property(nonatomic,strong)FMDatabaseQueue *dbQueue;
+(MCDreamManager *)maneger;
-(NSArray *)selectedAllDreamCate;
-(NSArray *)selectedZGDreamByCateId:(NSString *)cateId;
-(NSArray *)selectedZGDreamByKey:(NSString *)key;
@end
