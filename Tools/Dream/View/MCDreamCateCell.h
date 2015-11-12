//
//  MCDreamCateCell.h
//  Tools
//
//  Created by 常峻玮 on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCDreamCate;
@interface MCDreamCateCell : UICollectionViewCell
@property(nonatomic,strong)MCDreamCate *dreamCate;
-(void)setupDreamCate:(MCDreamCate *)dreamCate;
@end
