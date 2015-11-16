//
//  MCNotepad.h
//  Tools
//
//  Created by cjw on 15/11/16.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCNotepad : NSObject
@property(nonatomic,copy)NSString *notepadId;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSArray *images;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *updateTime;
@end
