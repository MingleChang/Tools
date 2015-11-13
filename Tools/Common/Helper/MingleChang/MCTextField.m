//
//  MCTextField.m
//  Text
//
//  Created by 常峻玮 on 15/5/6.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCTextField.h"

@implementation MCTextField
-(instancetype)init{
    self=[super init];
    if (self) {
        [self initAllSubViewAndDate];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initAllSubViewAndDate];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self initAllSubViewAndDate];
}
#pragma mark - Private Motheds
-(void)initAllSubViewAndDate{
    [self initAllSubView];
    [self initAllDate];
}
-(void)initAllSubView{
    self.tintColor=[UIColor clearColor];
}
-(void)initAllDate{
    
}

#pragma mark -
//取消TextField的长按选中，复制功能
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(paste:))
        return NO;
    if (action == @selector(select:))
        return NO;
    if (action == @selector(selectAll:))
        return NO;
    if (action == @selector(copy:)) {
        return NO;
    }
    if (action == @selector(cut:)) {
        return NO;
    }
    return NO;
//    return [super canPerformAction:action withSender:sender];
}
//取消TextField的长按放大镜功能
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        return NO;
    }
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
