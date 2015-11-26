//
//  MCLotteryListViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCLotteryListViewController.h"
#import "MCLotteryCate.h"
#import "MCLottery.h"
#import "MCLotteryRoot.h"

@interface MCLotteryListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)UIActivityIndicatorView *activityIndicatorView;

@property(nonatomic,strong)NSURLSessionDataTask *sessionDataTask;
@property(nonatomic,copy)NSArray *lotteryArray;

@end

@implementation MCLotteryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private
#pragma mark - Request
-(void)requestLotteryInfo{
    [self.sessionDataTask cancel];
    [self.activityIndicatorView startAnimating];
    NSURL *lURL=[NSURL URLWithString:self.lotteryCate.url];
    NSURLRequest *lRequest=[NSURLRequest requestWithURL:lURL];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicatorView stopAnimating];
            if (error) {
                return;
            }
            NSDictionary *lDictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            MCLotteryRoot *lLotteryRoot=[[MCLotteryRoot alloc]initWithDictionary:lDictionary];
            self.lotteryArray=lLotteryRoot.lotteries;
            [self.tableView reloadData];
        });
    }];
    [self.sessionDataTask resume];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    [self requestLotteryInfo];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=self.lotteryCate.name;
    self.activityIndicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    UIBarButtonItem *lLeftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.activityIndicatorView];
    self.navigationItem.rightBarButtonItem=lLeftBarButtonItem;
}
@end
