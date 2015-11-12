//
//  MCDreamCate.m
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamCate.h"
#import "FMDB.h"

@implementation MCDreamCate
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"ID"]) {
        self.cateId=value;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"id=>%@\nname=>%@\ninfo=>%@",self.cateId,self.name,self.info];
}

#pragma mark - SQL Class Mothed
+(NSString *)selectSQLByAll{
    return @"SELECT * FROM class ORDER BY ID ASC";
}
+(NSArray *)cateArrayByResultSet:(FMResultSet *)resultSet{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    while ([resultSet next]) {
        NSDictionary *lResultDic=[resultSet resultDictionary];
        MCDreamCate *lCate=[[MCDreamCate alloc]initWithDictionary:lResultDic];
        [lMutableArray addObject:lCate];
    }
    return [lMutableArray copy];
}
@end
