//
//  MCCompassViewController.m
//  Tools
//
//  Created by cjw on 15/11/13.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCCompassViewController.h"
@import CoreLocation;

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

@interface MCCompassViewController ()<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *compassImageView;
@property(nonatomic,strong) CLLocationManager *locationManager;
@end

@implementation MCCompassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if ([CLLocationManager headingAvailable]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingHeading];
    }else{
        UIAlertController *lAlertController=[UIAlertController alertControllerWithTitle:@"提示" message:@"您的设备不支持该功能" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *lCancelAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [lAlertController addAction:lCancelAction];
        [self presentViewController:lAlertController animated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate
#pragma mark - CLLocationManager Delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    //根据角度旋转图片 ，newHeading.magneticHeading为夹角
    CGAffineTransform transform = CGAffineTransformMakeRotation(-1 * DEGREES_TO_RADIANS(newHeading.magneticHeading));
    self.compassImageView.transform = transform;
    
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
    
}


#pragma mark - Override
-(void)resetNavigationBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
@end
