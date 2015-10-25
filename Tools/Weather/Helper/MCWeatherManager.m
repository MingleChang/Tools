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
@end
