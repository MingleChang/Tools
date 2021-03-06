//
//  APIStoreRequest.m
//  Tools
//
//  Created by 常峻玮 on 15/10/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "APIStoreRequest.h"

#define API_KEY @"b318a6a8f03e9a22d74538190bf5aa34"

#define WEATHER_URL @"http://apis.baidu.com/heweather/weather/free"
#define IDNUMBER_URL @"http://apis.baidu.com/apistore/idservice/id"
#define MOBILE_URL @"http://apis.baidu.com/apistore/mobilenumber/mobilenumber"

@implementation APIStoreRequest
#pragma mark - Weather API 天气
+(NSURLRequest *)getWeatherRequestWithCityName:(NSString *)name{
    NSString *lURLStr=[NSString stringWithFormat:@"%@?city=%@",WEATHER_URL,name];
    NSURL *lURL=[NSURL URLWithString:lURLStr];
    NSMutableURLRequest *lURLRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lURLRequest setValue:API_KEY forHTTPHeaderField:@"apikey"];
    return [lURLRequest copy];
}
+(NSURLRequest *)getWeatherRequestWithCityId:(NSString *)cityid{
    NSString *lURLStr=[NSString stringWithFormat:@"%@?cityid=%@",WEATHER_URL,cityid];
    NSURL *lURL=[NSURL URLWithString:lURLStr];
    NSMutableURLRequest *lURLRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lURLRequest setValue:API_KEY forHTTPHeaderField:@"apikey"];
    return [lURLRequest copy];
}
+(NSURLRequest *)getWeatherRequestWithIP:(NSString *)cityIP{
    NSString *lURLStr=[NSString stringWithFormat:@"%@?cityip=%@",WEATHER_URL,cityIP];
    NSURL *lURL=[NSURL URLWithString:lURLStr];
    NSMutableURLRequest *lURLRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lURLRequest setValue:API_KEY forHTTPHeaderField:@"apikey"];
    return [lURLRequest copy];
}
#pragma mark - ID Number 身份证
+(NSURLRequest *)getIDNumberRequestWithIDNumber:(NSString *)idNumber{
    NSString *lURLStr=[NSString stringWithFormat:@"%@?id=%@",IDNUMBER_URL,idNumber];
    NSURL *lURL=[NSURL URLWithString:lURLStr];
    NSMutableURLRequest *lURLRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lURLRequest setValue:API_KEY forHTTPHeaderField:@"apikey"];
    return [lURLRequest copy];
}
#pragma mark - Mobile
+(NSURLRequest *)getMobileRequestWithMobile:(NSString *)Mobile{
    NSString *lURLStr=[NSString stringWithFormat:@"%@?phone=%@",MOBILE_URL,Mobile];
    NSURL *lURL=[NSURL URLWithString:lURLStr];
    NSMutableURLRequest *lURLRequest=[NSMutableURLRequest requestWithURL:lURL];
    [lURLRequest setValue:API_KEY forHTTPHeaderField:@"apikey"];
    return [lURLRequest copy];
}
@end
