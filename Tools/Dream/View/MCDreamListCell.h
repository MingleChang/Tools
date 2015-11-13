//
//  MCDreamListCell.h
//  Tools
//
//  Created by cjw on 15/11/13.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCZGDream;
@interface MCDreamListCell : UITableViewCell
@property(nonatomic,strong)MCZGDream *dream;
-(void)setupDream:(MCZGDream *)dream;
@end
