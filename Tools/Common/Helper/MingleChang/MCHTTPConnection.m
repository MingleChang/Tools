//
//  MCHTTPConnection.m
//  Category_OS
//
//  Created by admin001 on 14/12/3.
//  Copyright (c) 2014年 MingleChang. All rights reserved.
//

#import "MCHTTPConnection.h"

typedef void (^MCHTTPConnectionProgress)(NSUInteger bytes, long long totalBytes, long long totalBytesExpected);
typedef void (^MCHTTPConnectionCompletionSuccess)(NSData *data);
typedef void (^MCHTTPConnectionCompletionFailed)(NSError *error);

@interface MCHTTPConnection()

@property(nonatomic,strong)NSURLConnection *HTTPConnection;
@property(nonatomic,strong)NSMutableData *downloadData;

@property(nonatomic,copy)MCHTTPConnectionProgress uploadProgress;//上传进度的block
@property(nonatomic,copy)MCHTTPConnectionProgress downloadProgress;//下载进度的block
@property(nonatomic,copy)MCHTTPConnectionCompletionSuccess success;//请求成功的block
@property(nonatomic,copy)MCHTTPConnectionCompletionFailed failed;//请求失败的block

@property(nonatomic,assign)long long totalBytesRead;//本地已经下载的字节数
@property(nonatomic,assign)long long totalBytes;//需要下载的总字节数

@end

@implementation MCHTTPConnection
#pragma mark - LifeCircle
-(instancetype)initWithRequest:(NSURLRequest *)request{
    self=[super init];
    if (self) {
        self.downloadData=[NSMutableData data];
        self.request=request;
    }
    return self;
}

+(MCHTTPConnection *)HTTPConnectionWithRequest:(NSURLRequest *)request{
    return [[MCHTTPConnection alloc]initWithRequest:request];
}

#pragma mark - Private Motheds

#pragma mark - Public Motheds
#pragma mark - Connection Control
-(void)start{
    self.HTTPConnection=[NSURLConnection connectionWithRequest:self.request delegate:self];
    [self.HTTPConnection start];
}
-(void)cancel{
    [self.HTTPConnection cancel];
}
#pragma mark - Setup HTTP Block
- (void)setUploadProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block{
    self.uploadProgress=block;
}

- (void)setDownloadProgressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))block{
    self.downloadProgress=block;
}

-(void)setCompletionSuccessBlock:(void (^)(NSData *data))success andFailedBlock:(void (^)(NSError *error))failed{
    self.success=success;
    self.failed=failed;
}

#pragma mark - Delegate
#pragma mark - URLConnection DataDelegate
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response{
    return request;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //在开始接收数据之前，将downloadData的内容置空，将totalBytes设置需要下载的数据的总长度，将totalBytesRead设置为0
    [self.downloadData setLength:0];
    self.totalBytes=response.expectedContentLength;
    self.response=response;
    self.totalBytesRead=0;
}

-(void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.uploadProgress) {
            self.uploadProgress((NSUInteger)bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
        }
    });
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.downloadData appendData:data];
    NSUInteger length=[data length];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.totalBytesRead+=(long long)length;
        if (self.downloadProgress) {
            self.downloadProgress(length, self.totalBytesRead, self.totalBytes);
        }
    });
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.success) {
            self.success([self.downloadData copy]);
        }
    });
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.failed) {
            self.failed(error);
        }
    });
}

@end
