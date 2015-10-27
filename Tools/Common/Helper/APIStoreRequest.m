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

@implementation APIStoreRequest
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
@end
