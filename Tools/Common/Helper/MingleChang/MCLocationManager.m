//
//  MCLocationManager.m
//  Tools
//
//  Created by 常峻玮 on 15/10/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCLocationManager.h"
@interface MCLocationManager()<CLLocationManagerDelegate>

@property(nonatomic,copy)LocationBlock locationBlock;
@property(nonatomic,copy)AddressBlock addressBlock;

@end

@implementation MCLocationManager
+(MCLocationManager *)manager{
    static MCLocationManager *managerInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance=[[MCLocationManager alloc]init];
    });
    return managerInstance;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}

-(void)requestLocation:(LocationBlock)block{
    self.locationBlock=block;
    [self requestLocation];
}
-(void)requestAddress:(AddressBlock)block{
    self.addressBlock=block;
    [self requestLocation];
}
-(void)requestLocation{
    self.locationManager=[[CLLocationManager alloc]init];
    self.locationManager.delegate=self;
//    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestLocation];
}
#pragma mark - Delegate
#pragma mark - CLLocationManager Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *lLocation=locations[0];
    if (self.locationBlock) {
        self.locationBlock(lLocation,YES);
        self.locationBlock=nil;
    }
    CLGeocoder *lGeocoder=[[CLGeocoder alloc]init];
    [lGeocoder reverseGeocodeLocation:lLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            if (self.addressBlock) {
                self.addressBlock(nil,NO);
                self.addressBlock=nil;
            }
        }else{
            CLPlacemark *lPlacemark=placemarks[0];
            if (self.addressBlock) {
                MCAddress *lAddress=[[MCAddress alloc]init];
                lAddress.name=lPlacemark.name;
                lAddress.country=lPlacemark.country;
                lAddress.province=lPlacemark.administrativeArea;
                lAddress.city=lPlacemark.locality;
                lAddress.area=lPlacemark.subLocality;
                lAddress.street=lPlacemark.thoroughfare;
                lAddress.number=lPlacemark.subThoroughfare;
                self.addressBlock(lAddress,YES);
                self.addressBlock=nil;
            }
        }
    }];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if (self.locationBlock) {
        self.locationBlock(nil,NO);
        self.locationBlock=nil;
    }
    if (self.addressBlock) {
        self.addressBlock(nil,NO);
        self.addressBlock=nil;
    }
}
@end
