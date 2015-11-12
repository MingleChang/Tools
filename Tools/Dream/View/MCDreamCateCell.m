//
//  MCDreamCateCell.m
//  Tools
//
//  Created by 常峻玮 on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamCateCell.h"
#import "MCDreamCate.h"
@interface MCDreamCateCell()
@property (weak, nonatomic) IBOutlet UIImageView *cateImageView;
@property (weak, nonatomic) IBOutlet UILabel *cateLabel;

@end
@implementation MCDreamCateCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
#pragma mark - Public Mothed
-(void)setupDreamCate:(MCDreamCate *)dreamCate{
    self.dreamCate=dreamCate;
    self.cateLabel.text=self.dreamCate.name;
    self.cateImageView.image=self.dreamCate.localImage;
}
@end
