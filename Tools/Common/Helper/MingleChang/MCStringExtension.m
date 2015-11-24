//
//  MCStringExtension.m
//  Tools
//
//  Created by cjw on 15/10/29.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCStringExtension.h"

@implementation NSString(Extension)

-(NSDate *)toDateWithFormat:(NSString *)format withTimeZone:(NSTimeZone *)timeZone{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    if (timeZone) {
        [dateFormatter setTimeZone:timeZone];
    }
    NSDate *lDate= [dateFormatter dateFromString:self];
    return lDate;
}
-(NSString *)URLEncode{
    NSString *resultStr = self;
    
    CFStringRef originalString = (__bridge CFStringRef) self;
    CFStringRef leaveUnescaped = CFSTR(" ");
    CFStringRef forceEscaped = CFSTR("!*'();:@&=+$,/?%#[]");
    
    CFStringRef escapedStr;
    escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,originalString,leaveUnescaped,forceEscaped,kCFStringEncodingUTF8);
    
    if( escapedStr )
    {
        NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
        CFRelease(escapedStr);
        
        // replace spaces with plusses
        [mutableStr replaceOccurrencesOfString:@" " withString:@"%20" options:0 range:NSMakeRange(0, [mutableStr length])];
        resultStr = [mutableStr copy];
    }
    return resultStr;
}
@end
