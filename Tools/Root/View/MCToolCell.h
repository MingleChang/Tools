//
//  MCToolCell.h
//  Tools
//
//  Created by cjw on 15/11/11.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCTool;
@interface MCToolCell : UICollectionViewCell
@property(nonatomic,strong)MCTool *tool;
-(void)setupTool:(MCTool *)tool;
@end
