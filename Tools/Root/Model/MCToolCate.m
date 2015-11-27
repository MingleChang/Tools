//
//  MCCate.m
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCToolCate.h"
#import "MCTool.h"

@implementation MCToolCate
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"tools"]&&[value isKindOfClass:[NSArray class]]) {
        [self setupTools:value];
    }
}
+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array{
    NSMutableArray *lArray=[NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *lDic in array) {
        MCToolCate *lToolCate=[[MCToolCate alloc]initWithDictionary:lDic];
        [lArray addObject:lToolCate];
    }
    return [lArray copy];
}
-(void)setupTools:(NSArray *)tools{
    self.allTools=[MCTool arrayModelByArrayOfDictionary:tools];
}
@end
