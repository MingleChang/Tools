//
//  MCHTTPConnection.h
//  Category_OS
//
//  Created by admin001 on 14/12/3.
//  Copyright (c) 2014年 MingleChang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCHTTPConnection : NSObject

@property(nonatomic,strong)NSURLRequest *request;
@property(nonatomic,strong)NSURLResponse *response;
/*
 网络请求启动
 参数：N/A
 返回值：N/A
 */
-(void)start;

/*
 网络请求取消
 参数：N/A
 返回值：N/A
 */
-(void)cancel;

/*
 设置上传进度的block
 参数说明：
 block：没上传一个数据包该block将会执行一次，bytesWritten表示本次上传的字节数，totalBytesWritten表示已经上传的字节数，totalBytesExpectedToWrite需要上传的总字节数
 返回值：
 N/A
 */
- (void)setUploadProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block;

/*
 设置下载进度的block
 参数说明：
 block：没上传一个数据包该block将会执行一次，bytesRead表示本次下载的字节数，totalBytesRead表示已经下载的字节数，totalBytesExpectedToRead需要下载的总字节数
 返回值：
 N/A
 */
- (void)setDownloadProgressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))block;

/*
 设置上传进度的block
 参数说明：
 success：HTTP请求成功后将会执行该block
 failed：HTTP请求失败后将会执行该block
 返回值：
 N/A
 */
-(void)setCompletionSuccessBlock:(void (^)(NSData *data))success andFailedBlock:(void (^)(NSError *error))failed;
@end

@interface MCHTTPConnection (Create)

-(instancetype)initWithRequest:(NSURLRequest *)request;

+(MCHTTPConnection *)HTTPConnectionWithRequest:(NSURLRequest *)request;

@end