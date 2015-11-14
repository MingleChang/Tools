//
//  MCFlashlightViewController.m
//  Tools
//
//  Created by cjw on 15/11/11.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCFlashlightViewController.h"
@import AVFoundation;

typedef NS_ENUM(NSInteger,FlashlightStatus){
    FlashlightStatusInvalid=-1,
    FlashlightStatusOn,
    FlashlightStatusOff,
};

@interface MCFlashlightViewController ()
@property (weak, nonatomic) IBOutlet UIButton *flashlightButton;
@property(nonatomic,strong)AVCaptureDevice *captureDevice;

@property(nonatomic,assign)FlashlightStatus status;

- (IBAction)flashlightButtonClick:(UIButton *)sender;

@end

@implementation MCFlashlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self resetFlashLight];
    [self resetFlashlightButton];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self tureOffFlashLight];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Mothed
-(void)resetFlashLight{
    if (self.status==FlashlightStatusOn) {
        [self tureOnFlashLight];
    }else{
        [self tureOffFlashLight];
    }
}
-(void)tureOnFlashLight{
    [self.captureDevice lockForConfiguration:nil];
    [self.captureDevice setTorchMode:AVCaptureTorchModeOn];
    [self.captureDevice unlockForConfiguration];
}
-(void)tureOffFlashLight{
    [self.captureDevice lockForConfiguration:nil];
    [self.captureDevice setTorchMode:AVCaptureTorchModeOff];
    [self.captureDevice unlockForConfiguration];
}
-(void)resetFlashlightButton{
    if (self.status==FlashlightStatusOn) {
        [self.flashlightButton setImage:[UIImage imageNamed:@"flashlight_turn_on"] forState:UIControlStateNormal];
        [self.flashlightButton setImage:[UIImage imageNamed:@"flashlight_turn_on"] forState:UIControlStateHighlighted];
    }else{
        [self.flashlightButton setImage:[UIImage imageNamed:@"flashlight_turn_off"] forState:UIControlStateNormal];
        [self.flashlightButton setImage:[UIImage imageNamed:@"flashlight_turn_off"] forState:UIControlStateHighlighted];
    }
}
#pragma mark - Event Response
- (IBAction)flashlightButtonClick:(UIButton *)sender {
    if (self.status==FlashlightStatusInvalid) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前设备没有闪光灯，不能提供手电筒功能" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    self.status=!self.status;
    [self resetFlashLight];
    [self resetFlashlightButton];
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
    self.captureDevice=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (![self.captureDevice hasTorch]) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前设备没有闪光灯，不能提供手电筒功能" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        self.status=FlashlightStatusInvalid;
    }else{
        self.status=FlashlightStatusOn;
    }
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
@end
