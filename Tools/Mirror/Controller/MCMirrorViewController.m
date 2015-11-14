//
//  MCMirrorViewController.m
//  Tools
//
//  Created by cjw on 15/11/11.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCMirrorViewController.h"
#import "MingleChang.h"

@import AVFoundation;
@interface MCMirrorViewController ()
@property(nonatomic,strong)AVCaptureSession *captureSession;
@property (strong,nonatomic) AVCaptureDeviceInput *captureDeviceInput;//负责从AVCaptureDevice获得输入数据
@property (strong,nonatomic) AVCaptureStillImageOutput *captureStillImageOutput;//照片输出流
@property (strong,nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//相机拍摄预览图层
@end

@implementation MCMirrorViewController
-(void)dealloc{
    [self.captureSession stopRunning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Mothed
-(AVCaptureDevice *)cameraWithPostion:(AVCaptureDevicePosition) position{
    NSArray *lDevices=[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in lDevices) {
        if (device.position==position) {
            return device;
        }
    }
    return nil;
}
-(AVCaptureDevice *)frontCamera{
    return [self cameraWithPostion:AVCaptureDevicePositionFront];
}
-(AVCaptureDevice *)backCamera{
    return [self cameraWithPostion:AVCaptureDevicePositionBack];
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
    if (self.captureDeviceInput&&[self.captureSession canAddInput:self.captureDeviceInput]) {
        [self.captureSession addInput:self.captureDeviceInput];
    }
    if (self.captureStillImageOutput&&[self.captureSession canAddOutput:self.captureStillImageOutput]) {
        [self.captureSession addOutput:self.captureStillImageOutput];
    }
    [self.view.layer insertSublayer:self.captureVideoPreviewLayer atIndex:0];
    
    [self.captureSession startRunning];
}
-(void)configureData{
    
}


#pragma mark - Override
-(void)resetNavigationBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Setter And Getter
-(AVCaptureSession *)captureSession{
    if (_captureSession) {
        return _captureSession;
    }
    _captureSession=[[AVCaptureSession alloc]init];
    _captureSession.sessionPreset=AVCaptureSessionPresetHigh;
    return _captureSession;
}
-(AVCaptureDeviceInput *)captureDeviceInput{
    if (_captureDeviceInput) {
        return _captureDeviceInput;
    }
    _captureDeviceInput=[[AVCaptureDeviceInput alloc]initWithDevice:[self frontCamera] error:nil];
    return _captureDeviceInput;
}
-(AVCaptureStillImageOutput *)captureStillImageOutput{
    if (_captureStillImageOutput) {
        return _captureStillImageOutput;
    }
    _captureStillImageOutput=[[AVCaptureStillImageOutput alloc]init];
    [_captureStillImageOutput setOutputSettings:@{AVVideoCodecKey:AVVideoCodecJPEG}];
    return _captureStillImageOutput;
}
-(AVCaptureVideoPreviewLayer *)captureVideoPreviewLayer{
    if (_captureVideoPreviewLayer) {
        return _captureVideoPreviewLayer;
    }
    _captureVideoPreviewLayer=[[AVCaptureVideoPreviewLayer alloc]initWithSession:self.captureSession];
    _captureVideoPreviewLayer.frame=SCREEN_BOUNDS;
    _captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _captureVideoPreviewLayer.backgroundColor=[UIColor blackColor].CGColor;
    return _captureVideoPreviewLayer;
}
@end
