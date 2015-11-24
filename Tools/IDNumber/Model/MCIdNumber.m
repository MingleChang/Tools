//
//  MCIdNumber.m
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCIdNumber.h"

@implementation MCIdNumber
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
    NSString *lSex=[self.sex.uppercaseString isEqualToString:@"M"]?@"男":([self.sex.uppercaseString isEqualToString:@"F"]?@"女":@"未知");
    NSString *lBirthday=self.birthday;
    NSString *lAddress=self.address;
    return [NSString stringWithFormat:@"性别：%@\n生日：%@\n地址：%@",lSex,lBirthday,lAddress];
}
@end
