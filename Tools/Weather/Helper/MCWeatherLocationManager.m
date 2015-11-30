//
//  MCWeatherLocationManager.m
//  Tools
//
//  Created by cjw on 15/11/30.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWeatherLocationManager.h"
#import "MCWeatherProvince.h"
#import "MCWeatherCity.h"
#import "MCWeatherArea.h"
#import "MCSearchCity.h"
#import "MCAddress.h"
@import CoreLocation;

#define LOCATION_CITY_ID @"LocationCityId"
#define LOCATION_METHOD @"LocationMethod"
#define LOCATION_UPDATE_TIME @"LocationUpdateTime"

#define UPDATE_DISTANCE 60*10

#define GET_ADDRESS_BY_IP @"http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json"

@interface MCWeatherLocationManager ()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)NSURLSessionDataTask *sessionDataTask;
@property(nonatomic,copy)CityIdBlock cityIdBlock;

@property(nonatomic,assign)LocationMethod method;
@property(nonatomic,copy)NSString *localCityId;
@property(nonatomic,assign)NSTimeInterval localUpdateTime;
@end

@implementation MCWeatherLocationManager
+(MCWeatherLocationManager *)manager{
    static MCWeatherLocationManager *managerInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance=[[MCWeatherLocationManager alloc]init];
    });
    return managerInstance;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        self.method=[[NSUserDefaults standardUserDefaults]integerForKey:LOCATION_METHOD];
        self.localCityId=[[NSUserDefaults standardUserDefaults]stringForKey:LOCATION_CITY_ID];
        self.localUpdateTime=[[NSUserDefaults standardUserDefaults]doubleForKey:LOCATION_UPDATE_TIME];
    }
    return self;
}
#pragma mark - Public Methods
-(void)requestCityId:(CityIdBlock)block{
    if (![self needUpdateLocation]) {
        if (block) {
            block(self.localCityId);
        }
        return;
    }
    if (block) {
        self.cityIdBlock=block;
    }
    [self requestLocation];
}

#pragma mark - Private Methods
-(BOOL)needUpdateLocation{
    if (self.method==LocationMethodDefault||self.localCityId.length==0) {
        return YES;
    }
    NSDate *lNowDate=[NSDate date];
    if (lNowDate.timeIntervalSince1970-self.localUpdateTime>UPDATE_DISTANCE) {
        return YES;
    }
    return NO;
}
-(void)requestAddressByIp{
    [self.sessionDataTask cancel];
    NSURL *lURL=[NSURL URLWithString:GET_ADDRESS_BY_IP];
    NSURLRequest *lRequest=[NSURLRequest requestWithURL:lURL];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            self.localCityId=[self getDefaultCityId];
        }else{
            NSDictionary *lDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            MCAddress *lAddress=[[MCAddress alloc]initWithDictionary:lDic];
            self.localCityId=[self getCityIdBy:lAddress];
        }
        self.localUpdateTime=[[NSDate date]timeIntervalSince1970];
        if (self.cityIdBlock) {
            self.cityIdBlock(self.localCityId);
        }
    }];
    [self.sessionDataTask resume];
}
-(NSString *)getCityIdBy:(MCAddress *)address{
    if (address==nil) {
        return  [self getDefaultCityId];
    }
    for (MCWeatherProvince *lProvince in self.cityList) {
        if ([address.province containsString:lProvince.name]) {
            for (MCWeatherCity *lCity in lProvince.weatherCities) {
                if ([address.city containsString:lCity.name]) {
                    for (MCWeatherArea *lArea in lCity.weatherAreas) {
                        if ([address.area containsString:lArea.name]) {
                            self.method=LocationMethodIP;
                            return lArea.identity;
                        }
                    }
                    MCWeatherArea *lArea=lCity.weatherAreas[0];
                    self.method=LocationMethodIP;
                    return lArea.identity;
                }
            }
            MCWeatherCity *lCity=lProvince.weatherCities[0];
            MCWeatherArea *lArea=lCity.weatherAreas[0];
            self.method=LocationMethodIP;
            return lArea.identity;
        }
    }
    return  [self getDefaultCityId];
}
-(NSString *)getDefaultCityId{
    self.method=LocationMethodDefault;
    MCWeatherProvince *lProvince=self.cityList[0];
    MCWeatherCity *lCity=lProvince.weatherCities[0];
    MCWeatherArea *lArea=lCity.weatherAreas[0];
    return lArea.identity;
}
-(void)requestLocation{
    self.locationManager=[[CLLocationManager alloc]init];
    self.locationManager.delegate=self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestLocation];
}
#pragma mark - Delegate
#pragma mark - CLLocationManager Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *lLocation=locations[0];
    CLGeocoder *lGeocoder=[[CLGeocoder alloc]init];
    [lGeocoder reverseGeocodeLocation:lLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            [self requestAddressByIp];
        }else{
            self.method=LocationMethodGPS;
            CLPlacemark *lPlacemark=placemarks[0];
            MCAddress *lAddress=[[MCAddress alloc]init];
            lAddress.name=lPlacemark.name;
            lAddress.country=lPlacemark.country;
            lAddress.province=lPlacemark.administrativeArea;
            lAddress.city=lPlacemark.locality;
            lAddress.area=lPlacemark.subLocality;
            lAddress.street=lPlacemark.thoroughfare;
            lAddress.number=lPlacemark.subThoroughfare;
            self.localCityId=[self getCityIdBy:lAddress];
            self.localUpdateTime=[[NSDate date]timeIntervalSince1970];
            if (self.cityIdBlock) {
                self.cityIdBlock(self.localCityId);
                self.cityIdBlock=nil;
            }
        }
    }];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [self requestAddressByIp];
}

#pragma mark - Setter And Getter
-(NSArray *)cityList{
    if (_cityList) {
        return _cityList;
    }
    NSString *lPath=[[NSBundle mainBundle]pathForResource:@"weather_citylist" ofType:@"json"];
    NSData *lData=[NSData dataWithContentsOfFile:lPath];
    NSArray *lArray=[NSJSONSerialization JSONObjectWithData:lData options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *lCityList=[NSMutableArray arrayWithCapacity:lArray.count];
    for (NSDictionary *lDic in lArray) {
        MCWeatherProvince *lProvice=[[MCWeatherProvince alloc]initWithDictionary:lDic];
        [lCityList addObject:lProvice];
    }
    _cityList=[lCityList copy];
    return _cityList;
}
-(void)setMethod:(LocationMethod)method{
    if (_method==method) {
        return;
    }
    _method=method;
    [[NSUserDefaults standardUserDefaults]setInteger:_method forKey:LOCATION_METHOD];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(void)setLocalCityId:(NSString *)localCityId{
    if ([_localCityId isEqualToString:localCityId]) {
        return;
    }
    _localCityId=localCityId;
    [[NSUserDefaults standardUserDefaults]setObject:_localCityId forKey:LOCATION_CITY_ID];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(void)setLocalUpdateTime:(NSTimeInterval)localUpdateTime{
    if (_localUpdateTime==localUpdateTime) {
        return;
    }
    _localUpdateTime=localUpdateTime;
    [[NSUserDefaults standardUserDefaults]setDouble:_localUpdateTime forKey:LOCATION_UPDATE_TIME];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
