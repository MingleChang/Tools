//
//  MCReciprocalDayCell.m
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCReciprocalDayCell.h"
#import "MCReciprocalDay.h"
#import "MingleChang.h"

@implementation MCReciprocalDayCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupReciprocalDay:(MCReciprocalDay *)reciprocalDay{
    self.reciprocalDay=reciprocalDay;
    self.textLabel.text=reciprocalDay.name;
    [self resetDetailLabel];
}
-(void)resetDetailLabel{
    MCDate *lNowDate=[MCDate date];
    NSInteger days=[lNowDate daysFrom:self.reciprocalDay.date];
    if (days>0) {
        self.detailTextLabel.text=[NSString stringWithFormat:@"已过去%i天",(int)(days+1)];
    }else if (days<0){
        self.detailTextLabel.text=[NSString stringWithFormat:@"还有%i天",(int)(days+1)];
    }else{
        if ([lNowDate isEarlierThanOrEqualTo:self.reciprocalDay.date]) {
            self.detailTextLabel.text=@"今天";
        }else{
            self.detailTextLabel.text=@"已过去1天";
        }
    }
}
@end
