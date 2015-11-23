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
        default:
            return @"MCFlashlightViewController";
            break;
    }
}
@end
