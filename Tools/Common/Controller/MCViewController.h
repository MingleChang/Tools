//
//  MCViewController.h
//  Tools
//
//  Created by 常峻玮 on 15/10/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCViewController : UIViewController
-(void)resetNavigationItem;
-(void)resetNavigationBar;
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender;
-(IBAction)backClick:(id)sender;
@end
