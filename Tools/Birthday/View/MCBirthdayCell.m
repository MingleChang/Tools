//
//  MCBirthdayCell.m
//  Tools
//
//  Created by cjw on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayCell.h"

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
}
@end
