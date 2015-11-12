//
//  MCDream.m
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCZGDream.h"
#import "FMDB.h"
@implementation MCZGDream
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"ID"]) {
        self.dreamId=value;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"id=>%@\ntitle=>%@\ncontext=>%@\ngroups=>%@",self.dreamId,self.title,self.context,self.groups];
}

#pragma mark - SQL Class Mothed
+(NSString *)selectSQLByCateId:(NSString *)cateId{
    return [NSString stringWithFormat:@"SELECT * FROM zgdream WHERE groups='%@' ORDER BY ID ASC",cateId];
}
+(NSString *)selectSQLByKey:(NSString *)key{
    return [NSString stringWithFormat:@"SELECT * FROM zgdream WHERE title LIKE '%%%@%%' ORDER BY ID ASC",key];
}
+(NSArray *)dreamArrayByResultSet:(FMResultSet *)resultSet{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    while ([resultSet next]) {
        NSDictionary *lResultDic=[resultSet resultDictionary];
        MCZGDream *lDream=[[MCZGDream alloc]initWithDictionary:lResultDic];
        [lMutableArray addObject:lDream];
        NSLog(@"%@",lDream);
    }
    return [lMutableArray copy];
}
@end
