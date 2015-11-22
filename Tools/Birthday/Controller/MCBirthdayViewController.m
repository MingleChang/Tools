//
//  MCBirthdayViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/21.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayViewController.h"
#import "MCBirthdayManager.h"
#import "MCBirthday.h"
#import "MingleChang.h"
#import "MCBirthdayEditViewController.h"

#define BIRTHDAY_EDIT_VC_SEGUE_ID @"MCBirthdayEditViewController"

@interface MCBirthdayViewController ()
@property(nonatomic,strong)NSMutableArray *birthdayArray;
@end

@implementation MCBirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Event Response
-(void)addBarButtonItemClick:(UIBarButtonItem *)sender{
    MCBirthday *lBirthday=[[MCBirthday alloc]init];
    [self performSegueWithIdentifier:BIRTHDAY_EDIT_VC_SEGUE_ID sender:lBirthday];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:BIRTHDAY_EDIT_VC_SEGUE_ID]) {
        MCBirthdayEditViewController *lViewController=(MCBirthdayEditViewController *)segue.destinationViewController;
        lViewController.birthday=sender;
        lViewController.birthdayArray=self.birthdayArray;
    }
}

#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    self.birthdayArray=[[[MCBirthdayManager manager]selectAllBirthday]mutableCopy];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"生日本";
    UIBarButtonItem *lAddBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(addBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=lAddBarButtonItem;
}
@end
