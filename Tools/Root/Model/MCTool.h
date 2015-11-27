//
//  MCTool.h
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,MCToolID){
    //常用工具
    MCToolIDFlashlight=100,//手电筒
    MCToolIDMirror=101,//镜子
    MCToolIDDream=102,//周公解梦
    MCToolIDCompass=103,//指南针
    MCToolIDNotepad=104,//记事本
    MCToolIDSizeControl=105,//尺码对照表
    MCToolIDBirthday=106,//生日本
    MCToolIDReciprocalDay=107,//倒数日
    MCToolIDIdNumber=108,//身份证查询
    MCToolIDMobile=109,//身份证查询
    MCToolIDExpress=110,//快递查询
    MCToolIDLottery=111,//彩票查询
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

+(NSArray *)arrayModelByArrayOfDictionary:(NSArray *)array;
@end
