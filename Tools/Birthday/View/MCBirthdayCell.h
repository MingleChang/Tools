//
//  MCBirthdayCell.h
//  Tools
//
//  Created by cjw on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCBirthday;
@interface MCBirthdayCell : UITableViewCell
@property(nonatomic,strong)MCBirthday *birthday;
-(void)setupBirthday:(MCBirthday *)birthday;
@end
