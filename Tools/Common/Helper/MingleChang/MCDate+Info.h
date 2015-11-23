//
//  MCDate+Info.h
//  Tools
//
//  Created by 常峻玮 on 15/11/21.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDate.h"

@interface MCDate (Solar)
-(void)changeToSolar;

-(NSString *)solarYear;
-(NSString *)solarMonth;
-(NSString *)solarDay;
-(NSString *)solarZodiac;

-(NSString *)longWeekday;
-(NSString *)shortWeekday;
@end

@interface MCDate (Lunar)
-(void)changeToLunar;

-(NSString *)lunarYear;
-(NSString *)lunarMonth;
-(NSString *)lunarDay;
-(NSString *)lunarZodiac;

-(NSString *)heavenlyStemYear;
-(NSString *)earthlyBranchYear;
-(NSString *)chineseYear;

@end
