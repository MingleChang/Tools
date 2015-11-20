//
//  UIImageView+Extension.m
//  Tools
//
//  Created by cjw on 15/11/20.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCImageViewExtension.h"
#import <objc/runtime.h>

@interface UIImageView(_Extension)
@property(nonatomic,strong)NSURLSessionDataTask *sessionDataTask;
@end

@implementation UIImageView (_Extension)
-(NSURLSessionDataTask *)sessionDataTask{
    return (NSURLSessionDataTask *)objc_getAssociatedObject(self, @selector(sessionDataTask));
}
-(void)setSessionDataTask:(NSURLSessionDataTask *)sessionDataTask{
    objc_setAssociatedObject(self, @selector(sessionDataTask), sessionDataTask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

@implementation UIImageView (Extension)
-(void)setImageWithRequest:(NSURLRequest *)request placeholderImage:(UIImage *)placeholderImage{
    [self.sessionDataTask cancel];
    if (placeholderImage) {
        self.image=placeholderImage;
    }
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
        }else{
            UIImage *lImage=[UIImage imageWithData:data];
            if (lImage) {
                self.image=lImage;
            }
        }
    }];
    [self.sessionDataTask resume];
}
@end
