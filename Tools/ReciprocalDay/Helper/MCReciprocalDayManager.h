//
//  MCReciprocalDayManager.h
//  Tools
//
//  Created by 常峻玮 on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCReciprocalDay;
@interface MCReciprocalDayManager : NSObject
+(MCReciprocalDayManager *)manager;

-(BOOL)createTable;
-(BOOL)insertReciprocalDay:(MCReciprocalDay *)reciprocalDay;
-(BOOL)updateReciprocalDay:(MCReciprocalDay *)reciprocalDay;
-(BOOL)deleteReciprocalDay:(MCReciprocalDay *)reciprocalDay;
-(NSArray *)selectAllReciprocalDay;
@end
