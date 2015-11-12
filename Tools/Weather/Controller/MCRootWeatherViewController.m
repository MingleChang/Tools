//
//  MCRootWeatherViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/10/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCRootWeatherViewController.h"
#import "MCWeatherManager.h"
@interface MCRootWeatherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *tmpLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTmpLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTmpLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *condLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSCLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDirLabel;
@property (weak, nonatomic) IBOutlet UILabel *humLabel;
@property (weak, nonatomic) IBOutlet UILabel *humDesLabel;

@end

@implementation MCRootWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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
    
}
-(void)configureData{
    [[MCWeatherManager manager]updateWeatherInfo:^(MCWeatherStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case WeatherStatusNone:
                    break;
                case WeatherStatusPositioning:
                    self.timeLabel.text=@"定位中...";
                    break;
                case WeatherStatusRequesting:
                    self.timeLabel.text=@"更新中...";
                    break;
                case WeatherStatusComplete:
                    [self resetWeatherInfo];
                    break;
                case WeatherStatusFailed:
                    break;
                default:
                    break;
            }
        });
    }];
    [self resetWeatherInfo];
}
-(void)resetWeatherInfo{
    if ([MCWeatherManager manager].weatherInfo==nil) {
        return;
    }
    MCWeatherDayInfo *lTodayWeather=[MCWeatherManager manager].weatherInfo.weatherDays[0];
    self.cityLabel.text=[MCWeatherManager manager].weatherInfo.weatherBasic.city;
    self.tmpLabel.text=[MCWeatherManager manager].weatherInfo.weatherNow.displayTmp;
    self.highTmpLabel.text=lTodayWeather.weatherTmp.displayMax;
    self.lowTmpLabel.text=lTodayWeather.weatherTmp.displayMin;
    self.timeLabel.text=[MCWeatherManager manager].weatherInfo.weatherBasic.updateTime.loc;
    self.condLabel.text=[MCWeatherManager manager].weatherInfo.weatherNow.weatherCond.txt;
    self.windSCLabel.text=[MCWeatherManager manager].weatherInfo.weatherNow.weatherWind.displaySc;
    self.windDirLabel.text=[MCWeatherManager manager].weatherInfo.weatherNow.weatherWind.dir;
    self.humLabel.text=[MCWeatherManager manager].weatherInfo.weatherNow.displayHum;
    self.humDesLabel.text=@"湿度";
}

#pragma mark - Override
-(void)resetNavigationBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
@end
