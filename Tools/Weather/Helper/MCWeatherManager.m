//
//  MCWeatherManager.m
//  Tools
//
//  Created by 常峻玮 on 15/10/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherManager.h"
#import "MCWeatherProvince.h"
#import "MCWeatherCity.h"
#import "MCWeatherArea.h"
#import "MCLocationManager.h"
#import "MCAddress.h"
#import "APIStoreRequest.h"

@interface MCWeatherManager()
@property(nonatomic,strong)NSURLSessionDataTask *sessionDataTask;
@property(nonatomic,copy)WeatherResultBlock block;
@end

@implementation MCWeatherManager
+(MCWeatherManager *)manager{
    static MCWeatherManager *managerInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance=[[MCWeatherManager alloc]init];
    });
    return managerInstance;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        [self setupCityList];
        self.method=[[NSUserDefaults standardUserDefaults]integerForKey:WEATHER_METHOD_USERDEFAULT];
        self.lastCityId=[[NSUserDefaults standardUserDefaults]stringForKey:LAST_CITY_ID_USERDEFAULT];
    }
    return self;
}

-(void)setupCityList{
    NSString *lPath=[[NSBundle mainBundle]pathForResource:@"weather_citylist" ofType:@"json"];
    NSData *lData=[NSData dataWithContentsOfFile:lPath];
    NSArray *lArray=[NSJSONSerialization JSONObjectWithData:lData options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *lCityList=[NSMutableArray arrayWithCapacity:lArray.count];
    for (NSDictionary *lDic in lArray) {
        MCWeatherProvince *lProvice=[[MCWeatherProvince alloc]initWithDictionary:lDic];
        [lCityList addObject:lProvice];
    }
    self.cityList=lCityList;
}
-(void)updateWeatherInfo:(WeatherResultBlock)block{
    self.block=block;
    if (self.method==GetWeatherMethodSelected) {
        self.block(WeatherStatusRequesting);
    }else{
        self.block(WeatherStatusPositioning);
    }
}
-(void)updateWeatherInfo{
    [[MCLocationManager manager]requestAddress:^(MCAddress *address, BOOL isSuccess) {
        if (isSuccess) {
            NSString *lCityId=[self getCityIdBy:address];
            NSLog(@"%@",lCityId);
            [self requestWeatherInfoWithCityId:lCityId];
        }else{
            NSLog(@"error");
        }
    }];
}
-(void)requestWeatherInfoWithCityId:(NSString *)cityid{
    [self.sessionDataTask cancel];
    NSURLRequest *lRequest=[APIStoreRequest getWeatherRequestWithCityId:cityid];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"weather error");
        }else{
            NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *lArray=[lDic objectForKey:@"HeWeather data service 3.0"];
            NSDictionary *lWeatherDic=[lArray objectAtIndex:0];
            self.weatherInfo=[[MCWeatherInfo alloc]initWithDictionary:lWeatherDic];
        }
    }];
    [self.sessionDataTask resume];
}
-(NSString *)getCityIdBy:(MCAddress *)address{
    for (MCWeatherProvince *lProvince in self.cityList) {
        if ([address.province containsString:lProvince.name]) {
            for (MCWeatherCity *lCity in lProvince.weatherCities) {
                if ([address.city containsString:lCity.name]) {
                    for (MCWeatherArea *lArea in lCity.weatherAreas) {
                        if ([address.area containsString:lArea.name]) {
                            return lArea.identity;
                        }
                    }
                    MCWeatherArea *lArea=lCity.weatherAreas[0];
                    return lArea.identity;
                }
            }
            MCWeatherCity *lCity=lProvince.weatherCities[0];
            MCWeatherArea *lArea=lCity.weatherAreas[0];
            return lArea.identity;
        }
    }
    MCWeatherProvince *lProvince=self.cityList[0];
    MCWeatherCity *lCity=lProvince.weatherCities[0];
    MCWeatherArea *lArea=lCity.weatherAreas[0];
    return lArea.identity;
}
@end
