//
//  MCMobileRoot.h
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCMobile;
@interface MCMobileRoot : NSObject
@property(nonatomic,assign)NSInteger errNum;
@property(nonatomic,copy)NSString *retMsg;
@property(nonatomic,strong)MCMobile *mobile;

-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
