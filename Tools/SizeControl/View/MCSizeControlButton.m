//
//  MCSizeControlButton.m
//  Tools
//
//  Created by 常峻玮 on 15/11/15.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCSizeControlButton.h"
@interface MCSizeControlButton()
@property(nonatomic,strong)IBOutlet UILabel *label;
@property(nonatomic,strong)IBOutlet UIView *statusView;
@property(nonatomic,strong)IBOutlet UIButton *button;
-(IBAction)buttonClick:(UIButton *)sender;
@end
@implementation MCSizeControlButton
-(void)awakeFromNib{
    [super awakeFromNib];
    [self configure];
}

#pragma mark - Event Response
-(IBAction)buttonClick:(UIButton *)sender{
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    
}
#pragma mark - Setter And Getter
-(BOOL)isSelected{
    return !self.statusView.hidden;
}
-(void)setIsSelected:(BOOL)isSelected{
    self.statusView.hidden=!isSelected;
}
@end
