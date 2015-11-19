//
//  MCNotepadImageCell.m
//  Tools
//
//  Created by 常峻玮 on 15/11/19.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadImageCell.h"
@interface MCNotepadImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *notepadImageView;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
- (IBAction)deleteButtonClick:(UIButton *)sender;

@end
@implementation MCNotepadImageCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setNotepadImage:(UIImage *)image{
    self.notepadImageView.image=image;
}
- (IBAction)deleteButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(notepadImageCellDeleteButtonClick:)]) {
        [self.delegate notepadImageCellDeleteButtonClick:self];
    }
}
@end
