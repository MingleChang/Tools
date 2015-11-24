//
//  APIStoreRequest.h
//  Tools
//
//  Created by 常峻玮 on 15/10/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIStoreRequest : NSObject

#pragma mark - Weather API
+(NSURLRequest *)getWeatherRequestWithCityName:(NSString *)name;
+(NSURLRequest *)getWeatherRequestWithCityId:(NSString *)cityid;
+(NSURLRequest *)getWeatherRequestWithIP:(NSString *)cityIP;


@end
