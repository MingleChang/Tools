//
//  MCNotepad.h
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;
@interface MCNotepad : NSObject
@property(nonatomic,copy)NSString *notepadId;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSArray *images;
@property(nonatomic,copy)NSArray *imageNames;
@property(nonatomic,strong)NSDate *create;
@property(nonatomic,strong)NSDate *modify;

-(instancetype)init;
-(instancetype)initWithDBDictionary:(NSDictionary *)dic;
-(NSDictionary *)toDBDictionary;

-(BOOL)save;
-(BOOL)update;
-(BOOL)destroy;

+(NSString *)sqlCreateTable;
+(NSString *)sqlInsert;
+(NSString *)sqlUpdate;
+(NSString *)sqlDelete;
+(NSString *)sqlSelectAll;

+(NSArray *)notepadArrayByResultSet:(FMResultSet *)resultSet;
@end