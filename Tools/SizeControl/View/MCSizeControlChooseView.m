//
//  MCSizeControlChooseView.m
//  Tools
//
//  Created by 常峻玮 on 15/11/15.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCSizeControlChooseView.h"
#import "MCSizeControlButton.h"

#define MIN_TAG 100

@interface MCSizeControlChooseView ()
@property(nonatomic,strong)MCSizeControlButton *selectedButton;
-(IBAction)sizeControlButtonClick:(MCSizeControlButton *)sender;

@end

@implementation MCSizeControlChooseView
-(void)awakeFromNib{
    [super awakeFromNib];
    [self configure];
}
#pragma mark - Private Mothed
-(void)selectedButton:(MCSizeControlButton *)button{
    if ([self.selectedButton isEqual:button]) {
        return;
    }
    self.selectedButton.isSelected=NO;
    self.selectedButton=button;
    self.selectedButton.isSelected=YES;
}
#pragma mark - Event Response
-(IBAction)sizeControlButtonClick:(MCSizeControlButton *)sender{
    if ([self.selectedButton isEqual:sender]) {
        return;
    }
    [self selectedButton:sender];
    if ([self.delegate respondsToSelector:@selector(sizeControlChooseView:selectedIndex:)]) {
        [self.delegate sizeControlChooseView:self selectedIndex:self.selectedButton.tag-MIN_TAG];
    }
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
    self.selectedIndex=0;
}
-(void)configureData{
    
}
#pragma mark - Setter And Getter
-(NSInteger)selectedIndex{
    NSInteger tag=self.selectedButton.tag;
    return tag-MIN_TAG;
}
-(void)setSelectedIndex:(NSInteger)selectedIndex{
    MCSizeControlButton *lButton=[self viewWithTag:selectedIndex+MIN_TAG];
    [self selectedButton:lButton];
}
@end
