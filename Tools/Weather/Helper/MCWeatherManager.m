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
#import "IPAddress.h"
#import "MingleChang.h"

#define WEATHER_ROOT_KEY @"HeWeather data service 3.0"

#define EXPIRE_TIME 60*60

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
-(void)saveWeatherMethodAndLastCityId{
    [[NSUserDefaults standardUserDefaults]setInteger:self.method forKey:WEATHER_METHOD_USERDEFAULT];
    [[NSUserDefaults standardUserDefaults]setObject:self.lastCityId forKey:LAST_CITY_ID_USERDEFAULT];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(void)cacheWeatherInfo:(NSDictionary *)dic{
    NSString *lFileName=[NSString stringWithFormat:@"tmp-%@",self.weatherInfo.weatherBasic.cityid];
    [MCCacheManager cacheObject:dic toFile:lFileName expireTime:EXPIRE_TIME];
    self.lastCityId=self.weatherInfo.weatherBasic.cityid;
    [self saveWeatherMethodAndLastCityId];
}
-(BOOL)needUpdateAfterReadLocal{
    if (self.lastCityId.length==0) {
        return YES;
    }
    NSString *lCacheName=[NSString stringWithFormat:@"tmp-%@",self.lastCityId];
    MCCache *lCache=[MCCacheManager getCacheByFile:lCacheName];
    if (lCache==nil) {
        return YES;
    }
    NSDictionary *lDic=(NSDictionary *)lCache.object;
    if (![lDic isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    self.weatherInfo=[[MCWeatherInfo alloc]initWithDictionary:lDic];
    return lCache.expire;
}
-(void)updateWeatherInfo:(WeatherResultBlock)block{
    if (![self needUpdateAfterReadLocal]) {
        return;
    }
    self.block=block;
    if (self.method==GetWeatherMethodSelected) {
        if (self.block) {
            self.block(WeatherStatusRequesting);
        }
        [self requestWeatherInfoWithCityId:self.lastCityId];
    }else{
        if (self.block) {
            self.block(WeatherStatusPositioning);
        }
        [self locationAddress];
    }
}
-(void)locationAddress{
    [[MCLocationManager manager]requestAddress:^(MCAddress *address, BOOL isSuccess) {
        if (isSuccess) {
            if (self.block) {
                self.block(WeatherStatusRequesting);
            }
            NSString *lCityId=[self getCityIdBy:address];
            self.method=GetWeatherMethodLocal;
            [self requestWeatherInfoWithCityId:lCityId];
        }else{
            if (self.method==GetWeatherMethodLocal) {
                if (self.block) {
                    self.block(WeatherStatusRequesting);
                }
                [self requestWeatherInfoWithCityId:self.lastCityId];
            }else{
                [self locationIPAddress];
            }
        }
    }];
}
-(void)locationIPAddress{
    self.method=GetWeatherMethodIP;
    NSString *lCityIP=[IPAddress getIPAddress];
    [self requestWeatherInfoWithCityIP:lCityIP];
}
-(void)requestWeatherInfoWithCityId:(NSString *)cityid{
    [self.sessionDataTask cancel];
    NSURLRequest *lRequest=[APIStoreRequest getWeatherRequestWithCityId:cityid];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"weather error");
            if (self.block) {
                self.block(WeatherStatusFailed);
            }
        }else{
            NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *lArray=[lDic objectForKey:WEATHER_ROOT_KEY];
            NSDictionary *lWeatherDic=[lArray objectAtIndex:0];
            self.weatherInfo=[[MCWeatherInfo alloc]initWithDictionary:lWeatherDic];
            [self cacheWeatherInfo:lWeatherDic];
            if (self.block) {
                self.block(WeatherStatusComplete);
            }
        }
    }];
    [self.sessionDataTask resume];
}
-(void)requestWeatherInfoWithCityIP:(NSString *)cityIP{
    [self.sessionDataTask cancel];
    NSURLRequest *lRequest=[APIStoreRequest getWeatherRequestWithIP:cityIP];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"weather error");
            if (self.block) {
                self.block(WeatherStatusFailed);
            }
        }else{
            NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *lArray=[lDic objectForKey:WEATHER_ROOT_KEY];
            NSDictionary *lWeatherDic=[lArray objectAtIndex:0];
            self.weatherInfo=[[MCWeatherInfo alloc]initWithDictionary:lWeatherDic];
            [self cacheWeatherInfo:lWeatherDic];
            if (self.block) {
                self.block(WeatherStatusComplete);
            }
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
