//
//  MCBirthdayDatePicker.m
//  Tools
//
//  Created by 常峻玮 on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayDatePicker.h"
@interface MCBirthdayDatePicker()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)segmentControlValueChange:(UISegmentedControl *)sender;
- (IBAction)datePickerValueChange:(UIDatePicker *)sender;
- (IBAction)doneButtonClick:(UIButton *)sender;

@end
@implementation MCBirthdayDatePicker
-(void)awakeFromNib{
    [super awakeFromNib];
}
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    self.type=MCBirthdayDatePickerTypeSolar;
}
-(void)configureData{
    
}
#pragma mark - Private Mothed
-(void)resetDatePickerType{
    if (self.type==MCBirthdayDatePickerTypeSolar) {
        self.datePicker.calendar=[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else{
        self.datePicker.calendar=[NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    }
}
#pragma mark - Event Response
- (IBAction)segmentControlValueChange:(UISegmentedControl *)sender {
    [self resetDatePickerType];
    if ([self.delegate respondsToSelector:@selector(birthdayDatePicker:changeType:)]) {
        [self.delegate birthdayDatePicker:self changeType:self.type];
    }
}

- (IBAction)datePickerValueChange:(UIDatePicker *)sender {
    if ([self.delegate respondsToSelector:@selector(birthdayDatePicker:changeDate:)]) {
        [self.delegate birthdayDatePicker:self changeDate:self.date];
    }
}

- (IBAction)doneButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(birthdayDatePickerDone:)]) {
        [self.delegate birthdayDatePickerDone:self];
    }
}
#pragma mark - Setter And Getter
-(MCBirthdayDatePickerType)type{
    return self.segmentedControl.selectedSegmentIndex;
}
-(void)setType:(MCBirthdayDatePickerType)type{
    self.segmentedControl.selectedSegmentIndex=type;
    [self resetDatePickerType];
}
-(NSDate *)date{
    return self.datePicker.date;
}
-(void)setDate:(NSDate *)date{
    self.datePicker.date=date;
}
@end
