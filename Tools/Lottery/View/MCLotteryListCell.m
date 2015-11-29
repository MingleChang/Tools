//
//  MCLotteryListCell.m
//  Tools
//
//  Created by 常峻玮 on 15/11/28.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCLotteryListCell.h"
#import "MCLotteryCate.h"
#import "MCLottery.h"
@interface MCLotteryListCell()
@property (weak, nonatomic) IBOutlet UILabel *lotteryName;
@property (weak, nonatomic) IBOutlet UILabel *lotteryExpect;
@property (weak, nonatomic) IBOutlet UILabel *lotteryOpenTime;
@property (weak, nonatomic) IBOutlet UILabel *lotteryCode;

@end
@implementation MCLotteryListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupLottery:(MCLottery *)lottery andLotteryCate:(MCLotteryCate *)lotteryCate{
    self.lottery=lottery;
    self.lotteryName.text=lotteryCate.name;
    self.lotteryExpect.text=[NSString stringWithFormat:@"%@期",lottery.expect];
    self.lotteryOpenTime.text=[NSString stringWithFormat:@"开奖:%@",lottery.opentime];
    self.lotteryCode.text=self.lottery.opencode;
}
@end
