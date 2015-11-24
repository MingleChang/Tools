//
//  MCStringExtension.h
//  Tools
//
//  Created by cjw on 15/10/29.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Extension)

//Date
-(NSDate *)toDateWithFormat:(NSString *)format withTimeZone:(NSTimeZone *)timeZone;
/*
 对字符串进行URLEncode转码，主要用于进行网络参数传递
 参数：N/A
 返回值：NSString，返回进行URLEncode转码之后的字符串
 */
-(NSString *)URLEncode;
@end
