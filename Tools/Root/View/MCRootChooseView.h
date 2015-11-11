//
//  MCRootChooseView.h
//  Tools
//
//  Created by 常峻玮 on 15/11/11.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCRootChooseView;

@protocol MCRootChooseViewDelegate <NSObject>

-(void)rootChooseView:(MCRootChooseView *)chooseView selectedIndex:(NSInteger)index;

@end

@interface MCRootChooseView : UIView
@property(nonatomic,assign)IBOutlet id<MCRootChooseViewDelegate> delegate;
@property(nonatomic,assign)NSInteger selectedIndex;
-(void)setupAllTitles:(NSArray *)titles;
@end
