//
//  MCNotepad.h
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FMResultSet;
@class MCDate;
@interface MCNotepad : NSObject
@property(nonatomic,copy)NSString *notepadId;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,strong)NSMutableArray *images;
@property(nonatomic,strong)NSMutableArray *imageNames;
@property(nonatomic,strong)MCDate *create;
@property(nonatomic,strong)MCDate *modify;

@property(nonatomic,copy,readonly)NSString *displayContent;

@property(nonatomic,assign)BOOL isSave;

-(instancetype)init;
-(instancetype)initWithDBDictionary:(NSDictionary *)dic;
-(NSDictionary *)toDBDictionary;
-(NSDictionary *)toDBDeleteDictionary;

-(void)deleteImageWithIndex:(NSInteger)index;

-(BOOL)isValid;

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
