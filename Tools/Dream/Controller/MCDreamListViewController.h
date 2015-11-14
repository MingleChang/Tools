//
//  MCDreamListViewController.h
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCViewController.h"
@class MCDreamCate;
@interface MCDreamListViewController : MCViewController
@property(nonatomic,strong)MCDreamCate *dreamCate;
@property(nonatomic,copy)NSString *searchKey;
@end
