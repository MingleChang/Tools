//
//  MCReciprocalDayViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCReciprocalDayViewController.h"
#import "MCReciprocalDayEditViewController.h"
#import "MCReciprocalDay.h"
#import "MCReciprocalDayManager.h"
#import "MCReciprocalDayCell.h"
#import "MingleChang.h"

#define RECIPROCALDAY_CELL_ID @"MCReciprocalDayCell"
#define RECIPROCALDAY_EDIT_VC_SEGUE_ID @"MCReciprocalDayEditViewController"

@interface MCReciprocalDayViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *reciprocalDayArray;

@end

@implementation MCReciprocalDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate
#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.reciprocalDayArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCReciprocalDay *lReciprocalDay=[self.reciprocalDayArray objectAtIndex:row];
    MCReciprocalDayCell *lCell=[tableView dequeueReusableCellWithIdentifier:RECIPROCALDAY_CELL_ID forIndexPath:indexPath];
    [lCell setupReciprocalDay:lReciprocalDay];
    return lCell;
}
#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row=[indexPath row];
    MCReciprocalDay *lReciprocalDay=[self.reciprocalDayArray objectAtIndex:row];
    [self performSegueWithIdentifier:RECIPROCALDAY_EDIT_VC_SEGUE_ID sender:lReciprocalDay];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:RECIPROCALDAY_EDIT_VC_SEGUE_ID]) {
        MCReciprocalDayEditViewController *lViewController=(MCReciprocalDayEditViewController *)segue.destinationViewController;
        lViewController.reciprocalDay=sender;
        lViewController.reciprocalDayArray=self.reciprocalDayArray;
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
    self.reciprocalDayArray=[[[MCReciprocalDayManager manager]selectAllReciprocalDay]mutableCopy];
}
#pragma mark - Event Response
-(void)addBarButtonItemClick:(UIBarButtonItem *)sender{
    MCReciprocalDay *lReciprocalDay=[[MCReciprocalDay alloc]init];
    [self performSegueWithIdentifier:RECIPROCALDAY_EDIT_VC_SEGUE_ID sender:lReciprocalDay];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"倒数日";
    UIBarButtonItem *lAddBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(addBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=lAddBarButtonItem;
}
@end
