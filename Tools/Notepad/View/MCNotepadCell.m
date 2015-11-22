//
//  MCNotepadCell.m
//  Tools
//
//  Created by 常峻玮 on 15/11/17.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadCell.h"
#import "MCNotepad.h"
#import "MingleChang.h"

@interface MCNotepadCell()
@property (weak, nonatomic) IBOutlet UIView *dateView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;

@end

@implementation MCNotepadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    
}
#pragma mark - Setter And Getter
-(void)setNotepad:(MCNotepad *)notepad{
    _notepad=notepad;
    self.infoLabel.text=[notepad displayContent];
    self.dateLabel.text=[notepad.modify formattedDateWithFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    self.infoImageView.hidden=!notepad.imageNames.count;
}

@end
