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

@end
