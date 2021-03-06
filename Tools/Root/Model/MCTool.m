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
+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array{
    NSMutableArray *lArray=[NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *lDic in array) {
        MCTool *lTool=[[MCTool alloc]initWithDictionary:lDic];
        [lArray addObject:lTool];
    }
    return [lArray copy];
}
#pragma mark - Setter And Getter
-(UIImage *)localImage{
    switch (self.toolId) {
        case MCToolIDFlashlight:
            return [UIImage imageNamed:@"tool_flashlight"];
            break;
        case MCToolIDMirror:
            return [UIImage imageNamed:@"tool_mirror"];
            break;
        case MCToolIDDream:
            return [UIImage imageNamed:@"tool_dream"];
            break;
        case MCToolIDCompass:
            return [UIImage imageNamed:@"tool_compass"];
            break;
        case MCToolIDNotepad:
            return [UIImage imageNamed:@"tool_notepad"];
            break;
        case MCToolIDSizeControl:
            return [UIImage imageNamed:@"tool_sizecontrol"];
            break;
        case MCToolIDBirthday:
            return [UIImage imageNamed:@"tool_birthday"];
            break;
        case MCToolIDReciprocalDay:
            return [UIImage imageNamed:@"tool_reciprocalday"];
            break;
        case MCToolIDIdNumber:
            return [UIImage imageNamed:@"tool_idnumber"];
            break;
        case MCToolIDMobile:
            return [UIImage imageNamed:@"tool_mobile"];
            break;
        case MCToolIDExpress:
            return [UIImage imageNamed:@"tool_express"];
            break;
        case MCToolIDLottery:
            return [UIImage imageNamed:@"tool_lottery"];
            break;
        default:
            return [UIImage imageNamed:@"tool_default"];
            break;
    }
}
-(NSString *)segueId{
    switch (self.toolId) {
        case MCToolIDFlashlight:
            return @"MCFlashlightViewController";
            break;
        case MCToolIDMirror:
            return @"MCMirrorViewController";
            break;
        case MCToolIDDream:
            return @"MCDreamCateViewController";
            break;
        case MCToolIDCompass:
            return @"MCCompassViewController";
            break;
        case MCToolIDNotepad:
            return @"MCNotepadViewController";
            break;
        case MCToolIDSizeControl:
            return @"MCSizeControlViewController";
            break;
        case MCToolIDBirthday:
            return @"MCBirthdayViewController";
            break;
        case MCToolIDReciprocalDay:
            return @"MCReciprocalDayViewController";
            break;
        case MCToolIDIdNumber:
            return @"MCIdNumberViewController";
            break;
        case MCToolIDMobile:
            return @"MCMobileViewController";
            break;
        case MCToolIDExpress:
            return @"MCExpressViewController";
            break;
        case MCToolIDLottery:
            return @"MCLotteryViewController";
            break;
        default:
            return @"MCWebViewController";
            break;
    }
}
@end
