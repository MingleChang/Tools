//
//  UIImageView+Extension.h
//  Tools
//
//  Created by cjw on 15/11/20.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
-(void)setImageWithRequest:(NSURLRequest *)request placeholderImage:(UIImage *)placeholderImage;
@end
