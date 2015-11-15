//
//  MCSizeControlChooseView.h
//  Tools
//
//  Created by 常峻玮 on 15/11/15.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCSizeControlChooseView;

@protocol MCSizeControlChooseViewDelegate <NSObject>

-(void)sizeControlChooseView:(MCSizeControlChooseView *)view selectedIndex:(NSInteger)index;

@end


@interface MCSizeControlChooseView : UIView
@property(nonatomic,assign)IBOutlet id<MCSizeControlChooseViewDelegate> delegate;
@property(nonatomic,assign)NSInteger selectedIndex;
@end
