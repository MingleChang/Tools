//
//  MCFilePath.m
//  Tools
//
//  Created by 常峻玮 on 15/11/9.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCFilePath.h"

@implementation MCFilePath
+(NSString *)homePath{
    return NSHomeDirectory();
}
+(NSString *)documentPath{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}
+(NSString *)libraryPath{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}
+(NSString *)cachePath{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}
+(NSString *)tmpPath{
    return NSTemporaryDirectory();
}
+(NSString *)pathInHomeWithFileName:(NSString *)fileName{
    return [self pathWithDirectoryPath:[self homePath] andFileName:fileName];
}
+(NSString *)pathInDocumentWithFileName:(NSString *)fileName{
    return [self pathWithDirectoryPath:[self documentPath] andFileName:fileName];
}
+(NSString *)pathInLibraryWithFileName:(NSString *)fileName{
    return [self pathWithDirectoryPath:[self libraryPath] andFileName:fileName];
}
+(NSString *)pathInCacheWithFileName:(NSString *)fileName{
    return [self pathWithDirectoryPath:[self cachePath] andFileName:fileName];
}
+(NSString *)pathInTmpFileName:(NSString *)fileName{
    return [self pathWithDirectoryPath:[self tmpPath] andFileName:fileName];
}
+(NSString *)pathWithDirectoryPath:(NSString *)directoryPath andFileName:(NSString *)fileName{
    return [directoryPath stringByAppendingPathComponent:fileName];
}
@end
