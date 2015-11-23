//
//  MCBirthdayCell.m
//  Tools
//
//  Created by cjw on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayCell.h"
#import "MCBirthday.h"
#import "MingleChang.h"

@interface MCBirthdayCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *solarDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *solarDaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *lunarDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lunarDaysLabel;

@end

@implementation MCBirthdayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    
}

#pragma mark - Public Mothed
-(void)setupBirthday:(MCBirthday *)birthday{
    self.birthday=birthday;
    self.nameLabel.text=birthday.name;
    [self resetAgeLabel];
    [self resetSolarInfo];
    [self resetLunarInfo];
}

-(void)resetAgeLabel{
    if (self.birthday.type==BirthdayTypeSolar) {
        [self.birthday.birthday changeToSolar];
    }else{
        [self.birthday.birthday changeToLunar];
    }
    NSInteger age=-1*[self.birthday.birthday yearsFrom:[MCDate date]];
    self.ageLabel.text=[NSString stringWithFormat:@"%i岁",(int)age];
}
-(void)resetSolarInfo{
    [self.birthday.birthday changeToSolar];
    self.solarDateLabel.text=[NSString stringWithFormat:@"%@月%@日",[self.birthday.birthday solarMonth],[self.birthday.birthday solarDay]];
    MCDate *birthdayDate=[MCDate dateWithMCDate:self.birthday.birthday];
    MCDate *lNowDate=[MCDate date];
    lNowDate.hour=0;
    lNowDate.minute=0;
    lNowDate.second=0;
    birthdayDate.yearForWeekOfYear=lNowDate.yearForWeekOfYear;
    if ([birthdayDate isEarlierThan:lNowDate]) {
        birthdayDate.yearForWeekOfYear=birthdayDate.yearForWeekOfYear+1;
    }
    NSInteger days=[birthdayDate daysFrom:lNowDate];
    if (days==0) {
        self.solarDaysLabel.text=@"今天";
    }else if (days==1){
        self.solarDaysLabel.text=@"明天";
    }else{
        self.solarDaysLabel.text=[NSString stringWithFormat:@"%i天后",(int)days];
    }
}
-(void)resetLunarInfo{
    [self.birthday.birthday changeToLunar];
    self.lunarDateLabel.text=[NSString stringWithFormat:@"%@%@",[self.birthday.birthday lunarMonth],[self.birthday.birthday lunarDay]];
    MCDate *birthdayDate=[MCDate dateWithMCDate:self.birthday.birthday];
    MCDate *lNowDate=[MCDate date];
    [lNowDate changeToLunar];
    lNowDate.hour=0;
    lNowDate.minute=0;
    lNowDate.second=0;
    birthdayDate.year=lNowDate.yearForWeekOfYear-birthdayDate.yearForWeekOfYear+birthdayDate.year;
    if ([birthdayDate isEarlierThan:lNowDate]) {
        birthdayDate.year=birthdayDate.year+1;
    }
    NSInteger days=[birthdayDate daysFrom:lNowDate];
    if (days==0) {
        self.lunarDaysLabel.text=@"今天";
    }else if (days==1){
        self.lunarDaysLabel.text=@"明天";
    }else{
        self.lunarDaysLabel.text=[NSString stringWithFormat:@"%i天后",(int)days];
    }
}
@end
