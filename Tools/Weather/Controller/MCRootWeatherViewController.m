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
    [self resetWeatherInfo];
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
}
-(void)resetWeatherInfo{
    if ([MCWeatherManager manager].weatherInfo==nil) {
        return;
    }
    MCWeatherDayInfo *lTodayWeather=[MCWeatherManager manager].weatherInfo.weatherDays[0];
    self.cityLabel.text=[MCWeatherManager manager].weatherInfo.weatherBasic.city;
    self.tmpLabel.text=[NSString stringWithFormat:@"%@°",[MCWeatherManager manager].weatherInfo.weatherNow.tmp];
    self.highTmpLabel.text=[NSString stringWithFormat:@"%@°",lTodayWeather.weatherTmp.max];
    self.lowTmpLabel.text=[NSString stringWithFormat:@"%@°",lTodayWeather.weatherTmp.min];
    self.timeLabel.text=[MCWeatherManager manager].weatherInfo.weatherBasic.updateTime.loc;
}
@end
