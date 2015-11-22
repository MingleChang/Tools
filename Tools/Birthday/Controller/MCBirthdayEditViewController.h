//
//  MCBirthdayEditViewController.h
//  Tools
//
//  Created by 常峻玮 on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCViewController.h"
@class MCBirthday;
@interface MCBirthdayEditViewController : MCViewController
@property(nonatomic,strong)MCBirthday *birthday;
@property(nonatomic,strong)NSMutableArray *birthdayArray;
@end
