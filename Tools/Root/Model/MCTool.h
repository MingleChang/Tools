//
//  MCTool.h
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,MCToolID){
    MCToolIDFlashlight=100,
    MCToolIDMirror=101,
    MCToolIDDream=102,
    MCToolIDCompass=103,
    MCToolIDNotepad=104,
    MCToolIDSizeControl=105,
    MCToolIDBirthday=106,
    MCToolIDReciprocalDay=107,
    MCToolIDCurrency=200,
};
typedef NS_ENUM(NSInteger,MCToolType){
    MCToolTypeLocal=0,
    MCToolTypeWeb,
};
@interface MCTool : NSObject
@property(nonatomic,assign)MCToolID toolId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)MCToolType type;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *url;

@property(nonatomic,strong,readonly)UIImage *localImage;
@property(nonatomic,copy,readonly)NSString *segueId;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
