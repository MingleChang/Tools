//
//  MCNotepadImageCell.h
//  Tools
//
//  Created by 常峻玮 on 15/11/19.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCNotepadImageCell;
@protocol MCNotepadImageCellDelegate <NSObject>

-(void)notepadImageCellDeleteButtonClick:(MCNotepadImageCell *)cell;

@end
@interface MCNotepadImageCell : UICollectionViewCell
@property(nonatomic,assign)id<MCNotepadImageCellDelegate> delegate;
-(void)setNotepadImage:(UIImage *)image;
@end
