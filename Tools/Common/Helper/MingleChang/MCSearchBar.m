//
//  MCSearchBar.m
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCSearchBar.h"

@implementation MCSearchBar
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self changeTextFieldColor];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self changeTextFieldColor];
}
-(void)changeTextFieldColor{
    UITextField *searchField = [self valueForKey:@"_searchField"];
    searchField.textColor = [UIColor whiteColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self changeTextFieldColor];
}


@end
