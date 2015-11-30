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
#import "MCAddress.h"
#import "APIStoreRequest.h"
#import "IPAddress.h"
#import "MingleChang.h"
#import "MCWeatherLocationManager.h"

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
        self.method=[[NSUserDefaults standardUserDefaults]integerForKey:WEATHER_METHOD_USERDEFAULT];
        self.lastCityId=[[NSUserDefaults standardUserDefaults]stringForKey:LAST_CITY_ID_USERDEFAULT];
    }
    return self;
}
#pragma mark - Public Motheds
-(void)updateWeatherInfo:(WeatherResultBlock)block{
    self.block=block;
    if (self.lastCityId.length==0 || self.method==GetWeatherMethodLocal) {
        if (self.block) {
            self.block(WeatherStatusPositioning);
        }
        [self locationAddress];
    }else {
        [self requestWeatherInfo];
    }
}
#pragma mark - Private Motheds
-(void)cacheWeatherInfo:(NSDictionary *)dic{
    NSString *lFileName=[NSString stringWithFormat:@"tmp-%@",self.weatherInfo.weatherBasic.cityid];
    [MCCacheManager cacheObject:dic toFile:lFileName expireTime:EXPIRE_TIME];
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

-(void)locationAddress{
    [[MCWeatherLocationManager manager]requestCityId:^(NSString *cityId) {
        self.lastCityId=cityId;
        [self requestWeatherInfo];
    }];
}

-(void)requestWeatherInfo{
    if (![self needUpdateAfterReadLocal]) {
        if (self.block) {
            self.block(WeatherStatusComplete);
        }
    }else{
        if (self.block) {
            self.block(WeatherStatusRequesting);
        }
        [self requestWeatherInfoWithCityId:self.lastCityId];
    }
}
-(void)requestWeatherInfoWithCityId:(NSString *)cityid{
    [self.sessionDataTask cancel];
    NSURLRequest *lRequest=[APIStoreRequest getWeatherRequestWithCityId:cityid];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
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

#pragma mark - Setter And Getter
-(void)setMethod:(GetWeatherMethod)method{
    if (_method==method) {
        return;
    }
    _method=method;
    [[NSUserDefaults standardUserDefaults]setInteger:_method forKey:WEATHER_METHOD_USERDEFAULT];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(void)setLastCityId:(NSString *)lastCityId{
    if ([_lastCityId isEqualToString:lastCityId]) {
        return;
    }
    _lastCityId=[lastCityId copy];
    [[NSUserDefaults standardUserDefaults]setObject:_lastCityId forKey:LAST_CITY_ID_USERDEFAULT];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
