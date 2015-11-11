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
    return [UIImage imageNamed:@"tool_default"];
//    switch (self.toolId) {
//        case MCToolIDFlashlight:
//            return [UIImage imageNamed:@"root_flashlight"];
//            break;
//        case MCToolIDMirror:
//            return [UIImage imageNamed:@"root_mirror"];
//            break;
//        default:
//            return [UIImage imageNamed:@"tool_default"];
//            break;
//    }
}
@end
