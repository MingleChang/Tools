//
//  MCBirthdayManager.h
//  Tools
//
//  Created by 常峻玮 on 15/11/22.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCBirthday;
@interface MCBirthdayManager : NSObject
+(MCBirthdayManager *)manager;

-(BOOL)createTable;
-(BOOL)insertBirthday:(MCBirthday *)birthday;
-(BOOL)updateBirthday:(MCBirthday *)birthday;
-(BOOL)deleteBirthday:(MCBirthday *)birthday;
-(NSArray *)selectAllBirthday;
@end
