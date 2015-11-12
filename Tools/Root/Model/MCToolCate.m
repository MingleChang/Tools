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
-(void)setupTools:(NSArray *)tools{
    NSMutableArray *lTools=[NSMutableArray arrayWithCapacity:tools.count];
    for (NSDictionary *dic in tools) {
        MCTool *lTool=[[MCTool alloc]initWithDictionary:dic];
        [lTools addObject:lTool];
    }
    self.allTools=lTools;
}
@end
