//
//  MCToolCell.m
//  Tools
//
//  Created by cjw on 15/11/11.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCToolCell.h"
#import "MCTool.h"
@interface MCToolCell()

@property (weak, nonatomic) IBOutlet UIImageView *toolImageView;
@property (weak, nonatomic) IBOutlet UILabel *toolName;

@end
@implementation MCToolCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


#pragma mark - Public Mothed
-(void)setupTool:(MCTool *)tool{
    self.tool=tool;
    self.toolImageView.image=tool.localImage;
    self.toolName.text=tool.name;
}
@end
