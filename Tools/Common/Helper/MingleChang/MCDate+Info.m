//
//  MCDate+Info.m
//  Tools
//
//  Created by 常峻玮 on 15/11/21.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDate+Info.h"

@interface MCDate (PublicArray)
+(NSArray *)lunarMonthArray;
@end

@implementation MCDate (PublicArray)

+(NSArray *)lunarMonthArray{
    return @[@"正月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"冬月",@"腊月"];
}
+(NSArray *)lunarDayArray{
    return @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十", @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十", @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"];
}
+(NSArray *)longWeekdayArray{
    return @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
}
+(NSArray *)shortWeekdayArray{
    return @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
}
//天干
+(NSArray *)heavenlyStems{
    return @[@"甲",@"乙",@"丙",@"丁",@"戊",@"己",@"庚",@"辛",@"壬",@"癸"];
}
//地支
+(NSArray *)earthlyBranches{
    return @[@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥"];
}
//生肖
+(NSArray *)zodiacArray{
    return @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
}
+(NSArray *)solarTerms{
    return @[@"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至", @"小暑", @"大暑", @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", @"小寒", @"大寒"];
}
@end
@implementation MCDate (Solar)
-(void)changeToSolar{
    if (![self.calendar.calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]) {
        self.calendar=[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
}
-(NSString *)solarYear{
    [self changeToSolar];
    return [NSString stringWithFormat:@"%i",(int)self.year];
}
-(NSString *)solarMonth{
    [self changeToSolar];
    return [NSString stringWithFormat:@"%i",(int)self.month];
}
-(NSString *)solarDay{
    [self changeToSolar];
    return [NSString stringWithFormat:@"%i",(int)self.day];
}
-(NSString *)solarZodiac{
    [self changeToSolar];
    NSInteger index=self.year+8;
    index=index%12;
    NSArray *zodiacArray=[MCDate zodiacArray];
    return [zodiacArray objectAtIndex:index];
}

-(NSString *)longWeekday{
    NSArray *longWeekdays=[MCDate longWeekdayArray];
    return [longWeekdays objectAtIndex:self.weekday];
}
-(NSString *)shortWeekday{
    NSArray *shortWeekdays=[MCDate shortWeekdayArray];
    return [shortWeekdays objectAtIndex:self.weekday];
}
@end

@implementation MCDate (Lunar)
-(void)changeToLunar{
    if (![self.calendar.calendarIdentifier isEqualToString:NSCalendarIdentifierChinese]) {
        self.calendar=[NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    }
}
-(NSString *)lunarYear{
    [self changeToLunar];
    return [NSString stringWithFormat:@"%i",(int)(self.yearForWeekOfYear-2637)];
}
-(NSString *)lunarMonth{
    [self changeToLunar];
    NSArray *lunarMonthArray=[MCDate lunarMonthArray];
    return lunarMonthArray[self.month-1];
}
-(NSString *)lunarDay{
    [self changeToLunar];
    NSArray *lunarDayArray=[MCDate lunarDayArray];
    return lunarDayArray[self.day-1];
}
-(NSString *)lunarZodiac{
    [self changeToLunar];
    NSArray *zodiacArray=[MCDate zodiacArray];
    NSInteger index=(self.year-1)%12;
    return [zodiacArray objectAtIndex:index];
}
-(NSString *)heavenlyStemYear{
    [self changeToLunar];
    NSInteger index=(self.year-1)%10;
    NSArray *heavenlyStems=[MCDate heavenlyStems];
    return [heavenlyStems objectAtIndex:index];
}
-(NSString *)earthlyBranchYear{
    [self changeToLunar];
    NSInteger index=(self.year-1)%12;
    NSArray *earthlyBranches=[MCDate earthlyBranches];
    return [earthlyBranches objectAtIndex:index];
}
-(NSString *)chineseYear{
    [self changeToLunar];
    return [NSString stringWithFormat:@"%@%@",[self heavenlyStemYear],[self earthlyBranchYear]];
}

@end
