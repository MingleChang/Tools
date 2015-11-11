//
//  MCRootChooseView.m
//  Tools
//
//  Created by 常峻玮 on 15/11/11.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCRootChooseView.h"
#import "MingleChang.h"

#define TAG_BASE 100

@interface MCRootChooseView()
@property(nonatomic,copy)NSArray *allButtons;
@property(nonatomic,strong)UIButton *selectedButton;
@end
@implementation MCRootChooseView

-(void)awakeFromNib{
    [super awakeFromNib];
}
-(void)setupAllTitles:(NSArray *)titles{
    NSInteger count=titles.count;
    CGFloat width=SCREEN_WIDTH/count;
    CGFloat height=self.frame.size.height;
    NSMutableArray *lButtons=[NSMutableArray arrayWithCapacity:count];
    for (int i=0; i<count; i++) {
        UIButton *lButton=[UIButton buttonWithType:UIButtonTypeCustom];
        lButton.tag=TAG_BASE+i;
        [lButton setFrame:CGRectMake(i*width, 0, width, height)];
        [lButton setTitle:titles[i] forState:UIControlStateNormal];
        lButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [lButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:lButton];
        [lButtons addObject:lButton];
        if (i==0) {
            self.selectedButton=lButton;
            self.selectedButton.backgroundColor=RGB(210, 60, 60);
            self.selectedButton.enabled=NO;
        }
    }
    self.allButtons=lButtons;
}
-(void)buttonClick:(UIButton *)sender{
    self.selectedButton.enabled=YES;
    self.selectedButton.backgroundColor=[UIColor clearColor];
    self.selectedButton=sender;
    self.selectedButton.backgroundColor=RGB(210, 60, 60);
    self.selectedButton.enabled=NO;
    if ([self.delegate respondsToSelector:@selector(rootChooseView:selectedIndex:)]) {
        [self.delegate rootChooseView:self selectedIndex:[self.allButtons indexOfObject:self.selectedButton]];
    }
    
}
#pragma mark - Event Response
-(NSInteger)selectedIndex{
    return [self.allButtons indexOfObject:self.selectedButton];
}
-(void)setSelectedIndex:(NSInteger)selectedIndex{
    UIButton *lButton=nil;
    if (selectedIndex>=self.allButtons.count) {
        lButton=self.allButtons.lastObject;
    }else{
        lButton=[self.allButtons objectAtIndex:selectedIndex];
    }
    if (![lButton isEqual:self.selectedButton]) {
        self.selectedButton.enabled=YES;
        self.selectedButton.backgroundColor=[UIColor clearColor];
        self.selectedButton=lButton;
        self.selectedButton.backgroundColor=RGB(210, 60, 60);
        self.selectedButton.enabled=NO;
    }
}
@end
