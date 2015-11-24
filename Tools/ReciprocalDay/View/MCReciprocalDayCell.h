//
//  MCReciprocalDayCell.h
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCReciprocalDay;
@interface MCReciprocalDayCell : UITableViewCell
@property(nonatomic,strong)MCReciprocalDay *reciprocalDay;
-(void)setupReciprocalDay:(MCReciprocalDay *)reciprocalDay;
@end
