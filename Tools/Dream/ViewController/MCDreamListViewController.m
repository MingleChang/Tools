//
//  MCDreamListViewController.m
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamListViewController.h"
#import "MCDreamCate.h"
#import "MCZGDream.h"
#import "MCDreamManager.h"
#import "MCDreamListCell.h"
#import "MCDreamDetailViewController.h"

#define DREAM_LIST_CELL_ID @"MCDreamListCell"
#define DREAM_DETAIL_VC_SEGUE_ID @"MCDreamDetailViewController"

@interface MCDreamListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)NSArray *dreams;
@end

@implementation MCDreamListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate
#pragma mark - UITableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dreams.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCZGDream *lDream=self.dreams[row];
    MCDreamListCell *lCell=[tableView dequeueReusableCellWithIdentifier:DREAM_LIST_CELL_ID forIndexPath:indexPath];
    [lCell setupDream:lDream];
    return lCell;
}
#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row=[indexPath row];
    MCZGDream *lDream=self.dreams[row];
    [self performSegueWithIdentifier:DREAM_DETAIL_VC_SEGUE_ID sender:lDream];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:DREAM_DETAIL_VC_SEGUE_ID]) {
        MCDreamDetailViewController *lViewConstroller=segue.destinationViewController;
        lViewConstroller.dream=sender;
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
    if (self.dreamCate) {
        self.dreams=[[MCDreamManager maneger]selectedZGDreamByCateId:self.dreamCate.cateId];
    }
    if (self.searchKey) {
        self.dreams=[[MCDreamManager maneger]selectedZGDreamByKey:self.searchKey];
    }
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    if (self.dreamCate) {
        self.navigationItem.title=self.dreamCate.name;
    }
    if (self.searchKey) {
        self.navigationItem.title=self.searchKey;
    }
}
@end
