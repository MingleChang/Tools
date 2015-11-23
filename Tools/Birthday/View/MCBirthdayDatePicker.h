//
//  MCBirthdayDatePicker.h
//  Tools
//
//  Created by 常峻玮 on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCBirthdayDatePicker;
typedef NS_ENUM(NSInteger,MCBirthdayDatePickerType){
    MCBirthdayDatePickerTypeSolar=0,
    MCBirthdayDatePickerTypeLunar=1,
};

@protocol MCBirthdayDatePickerDelegate <NSObject>

-(void)birthdayDatePicker:(MCBirthdayDatePicker *)datePicker changeType:(MCBirthdayDatePickerType)type;
-(void)birthdayDatePicker:(MCBirthdayDatePicker *)datePicker changeDate:(NSDate *)date;
-(void)birthdayDatePickerDone:(MCBirthdayDatePicker *)datePicker;

@end

@interface MCBirthdayDatePicker : UIView
@property(nonatomic,assign)id<MCBirthdayDatePickerDelegate> delegate;
@property(nonatomic,assign)MCBirthdayDatePickerType type;
@property(nonatomic,strong)NSDate *date;
@end
