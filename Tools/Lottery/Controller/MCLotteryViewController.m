//
//  MCLotteryViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCLotteryViewController.h"
#import "MCLotteryCate.h"
#import "MCLotteryListViewController.h"
#import "MingleChang.h"

#define LOTTERY_LIST_VC_SEGUE_ID @"MCLotteryListViewController"

#define LOTTERY_CATE_CELL_ID @"LotteryCateCell"

@interface MCLotteryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,copy)NSArray *lotteryCates;

@end

@implementation MCLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Mothed
-(void)readAllLotteryCate{
    NSData *lData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"lottery" ofType:@"json"]];
    NSArray *lArray=[NSJSONSerialization JSONObjectWithData:lData options:NSJSONReadingAllowFragments error:nil];
    self.lotteryCates=[MCLotteryCate arrayModelByArrayOfDictionary:lArray];
}
#pragma mark - Delegate
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lotteryCates.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCLotteryCate *lLotteryCate=[self.lotteryCates objectAtIndex:row];
    UITableViewCell *lCell=[tableView dequeueReusableCellWithIdentifier:LOTTERY_CATE_CELL_ID forIndexPath:indexPath];
    lCell.textLabel.text=lLotteryCate.name;
    return lCell;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row=[indexPath row];
    MCLotteryCate *lLotteryCate=[self.lotteryCates objectAtIndex:row];
    [self performSegueWithIdentifier:LOTTERY_LIST_VC_SEGUE_ID sender:lLotteryCate];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:LOTTERY_LIST_VC_SEGUE_ID]) {
        MCLotteryListViewController *lViewController=(MCLotteryListViewController *)segue.destinationViewController;
        lViewController.lotteryCate=sender;
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
    [self readAllLotteryCate];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"彩票查询";
}
@end
