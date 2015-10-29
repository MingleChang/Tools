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

@end
