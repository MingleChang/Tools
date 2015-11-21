//
//  MCNotepadBigImageCell.m
//  Tools
//
//  Created by 常峻玮 on 15/11/21.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadBigImageCell.h"
@interface MCNotepadBigImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *notepadImageView;

@end
@implementation MCNotepadBigImageCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setImage:(UIImage *)image{
    self.notepadImageView.image=image;
}
@end
