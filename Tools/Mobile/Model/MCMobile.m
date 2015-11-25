//
//  MCMobile.m
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCMobile.h"

@implementation MCMobile
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString *)displayInfo{
    NSString *lInfoStr=[NSString stringWithFormat:@"号码：%@\n地区：%@%@\n运营商：%@\n类型：%@",self.phone,self.province,self.city,self.supplier,self.suit];
    return lInfoStr;
}
@end
