//
//  MCLocationManager.h
//  Tools
//
//  Created by 常峻玮 on 15/10/26.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCAddress.h"
@import CoreLocation;

typedef void (^LocationBlock)(CLLocation *location,BOOL isSuccess);
typedef void (^AddressBlock)(MCAddress *address,BOOL isSuccess);

@interface MCLocationManager : NSObject

@property(nonatomic,strong)CLLocationManager *locationManager;

+(MCLocationManager *)manager;
-(void)requestLocation:(LocationBlock)block;
-(void)requestAddress:(AddressBlock)block;
@end
