//
//  MCTool.m
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCTool.h"

@implementation MCTool
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

#pragma mark - Setter And Getter
-(UIImage *)localImage{
    switch (self.toolId) {
        case MCToolIDTorch:
            return [UIImage imageNamed:@"root_torch"];
            break;
        default:
            return [UIImage imageNamed:@"tool_default"];
            break;
    }
}
@end
