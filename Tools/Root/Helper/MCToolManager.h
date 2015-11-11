//
//  MCToolManager.h
//  Tools
//
//  Created by 常峻玮 on 15/11/10.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCTool;
@interface MCToolManager : NSObject
@property(nonatomic,copy)NSArray *toolsInfo;
+(MCToolManager *)manager;
@end
