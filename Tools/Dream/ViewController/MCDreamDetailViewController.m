//
//  MCDreamDetailViewController.m
//  Tools
//
//  Created by cjw on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamDetailViewController.h"
#import "MCZGDream.h"

@interface MCDreamDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation MCDreamDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.detailLabel.text=self.dream.context;
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=self.dream.title;
}
@end
