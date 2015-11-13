//
//  MCDreamListCell.m
//  Tools
//
//  Created by cjw on 15/11/13.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamListCell.h"
#import "MCZGDream.h"

@implementation MCDreamListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Public Mothed
-(void)setupDream:(MCZGDream *)dream{
    self.dream=dream;
    self.textLabel.text=self.dream.title;
    self.detailTextLabel.text=self.dream.context;
}
@end
