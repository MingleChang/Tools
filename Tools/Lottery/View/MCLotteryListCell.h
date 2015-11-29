//
//  MCLotteryListCell.h
//  Tools
//
//  Created by 常峻玮 on 15/11/28.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCLottery;
@class MCLotteryCate;
@interface MCLotteryListCell : UITableViewCell
@property(nonatomic,strong)MCLottery *lottery;
-(void)setupLottery:(MCLottery *)lottery andLotteryCate:(MCLotteryCate *)lotteryCate;
@end
