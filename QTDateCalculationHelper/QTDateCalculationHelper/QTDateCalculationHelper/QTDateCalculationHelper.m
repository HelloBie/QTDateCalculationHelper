//
//  QTDateCalculationHelper.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/29.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTDateCalculationHelper.h"

@implementation QTDateCalculationHelper


#pragma mark 字符串与NSDate之间转换 ↓↓↓

/// 将字符串转为NSDate对象
/// @param timeString 时间字符串
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日
+(NSDate *)getDateWithTimeString:(NSString *)timeString
                          format:(NSString *)formatString
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatString];//根据自己的需求定义格式
    formater.timeZone = [NSTimeZone systemTimeZone];
    NSDate * date = [formater dateFromString:timeString];
    return date;
}

/// 将NSDate对象转换为字符串
/// @param date 时间对象
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日
+(NSString *)getTimeStringWithDate:(NSDate *)date
                            format:(NSString *)formatString
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatString];//根据自己的需求定义格式
    formater.timeZone = [NSTimeZone systemTimeZone];
    return [formater stringFromDate:date];
}

#pragma mark 常用方法 ↓↓↓

/// =============== 获取当前时间字符串 ===============
/// @param formatString 时间格式,例如:yyyy年MM月dd日
+ (NSString *)getNowDateStringWithFormat:(NSString *)formatString
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatString];//根据自己的需求定义格式
    formater.timeZone = [NSTimeZone systemTimeZone];
    NSDate* now = [NSDate date];
    
    return [formater stringFromDate:now];
}

/// 获取目标日期星期几
/// @param timeString 目标时间,字符串类型
/// @param formatString 解析时间字符串的格式,例如:yyyy年MM月dd日
+ (NSInteger)getWeekNumberWithTime:(NSString *)timeString
                            format:(NSString *)formatString
{
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    formater .timeZone = [NSTimeZone systemTimeZone];
    [formater setDateFormat:formatString];//根据自己的需求定义格式
    
    NSDate *inputDate = [formater dateFromString:timeString];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return theComponents.weekday;
}


/// 获取月份天数
/// @param timeString 目标时间字符串
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日
+ (NSInteger)getMonthMaxDayWithTimeString:(NSString *)timeString
                                   format:(NSString *)formatString
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[QTDateCalculationHelper getDateWithTimeString:timeString format:formatString]];
    
    return range.length;
}

#pragma mark - 日期计算 ↓↓↓

/// 计算与今天相隔几天,正数今天之后,负数今天之前
/// @param timeString 目标时间的字符串
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日 HH:mm:sss
+ (NSInteger)daysWithTime:(NSString *)timeString
                   format:(NSString *)formatString
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatString];//根据自己的需求定义格式
    NSDate* startDate = [NSDate date];
    NSDate* endDate = [formater dateFromString:timeString];
    NSTimeInterval times = [endDate timeIntervalSinceDate:startDate];
    return times / 86400;
}


/// 计算两个时间相差几天
/// @param firstTimeString 第一个时间字符串
/// @param lastTimeString 第二个时间字符串
/// @param formatString 解析时间字符串的格式,例如:yyyy年MM月dd日
+ (NSInteger)getDaysAfterTime:(NSString *)firstTimeString
                   beforeTime:(NSString *)lastTimeString
                       format:(NSString *)formatString
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSDate *startDate = [dateFormatter dateFromString:firstTimeString];
    NSDate *endDate = [dateFormatter dateFromString:lastTimeString];
    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /**
     * 要比较的时间单位,常用如下,可以同时传:
     * NSCalendarUnitDay : 天
     * NSCalendarUnitYear : 年
     * NSCalendarUnitMonth : 月
     * NSCalendarUnitHour : 时
     * NSCalendarUnitMinute : 分
     * NSCalendarUnitSecond : 秒
     */
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    //比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
    return delta.day;
}


/// 返回n周后的日期
/// @param timeString 开始计算的日期
/// @param weekCount 要计算几个星期
/// @param formatString 日期字符串的格式,例如:yyyy年MM月dd日
+ (NSString *)getTimeAfterWeekCountWithTimeString:(NSString *)timeString
                                        weekCount:(NSInteger)weekCount
                                           format:(NSString *)formatString
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatString;
    format.timeZone = [NSTimeZone systemTimeZone];
    
    NSDate *beginDate = [format dateFromString:timeString];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setWeekdayOrdinal:weekCount];
    
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    
    return [format stringFromDate:start];
}


/// =============== 返回n年,n月,n日后的时间 ===============
/// @param timeString 开始计算的日期
/// @param year 年数
/// @param month 月数
/// @param day 天数
/// @param formatString 日期字符串的格式,例如:yyyy年MM月dd日
+ (NSString *)getTimeWithTimeString:(NSString *)timeString
                               year:(NSInteger)year
                              month:(NSInteger)month
                                day:(NSInteger)day
                             format:(NSString *)formatString
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatString;
    format.timeZone = [NSTimeZone systemTimeZone];
    NSDate *beginDate = [format dateFromString:timeString];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    
    return [format stringFromDate:start];
}

/// =============== 返回n时,n分,n秒后的时间 ===============
/// @param timeString 开始计算的日期
/// @param hour 小时数
/// @param minute 分钟数
/// @param second 秒数
/// @param formatString 日期字符串的格式,例如:yyyy年MM月dd日
+ (NSString *)getTimeWithTimeString:(NSString *)timeString
                               hour:(NSInteger)hour
                             minute:(NSInteger)minute
                             second:(NSInteger)second
                             format:(NSString *)formatString
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatString;
    format.timeZone = [NSTimeZone systemTimeZone];
    NSDate *beginDate = [format dateFromString:timeString];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setHour:hour];
    [adcomps setMinute:minute];
    [adcomps setSecond:second];
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    
    return [format stringFromDate:start];
}


/// =============== 将时间文字转换成多久之前文字 ===============
/// @param timeString 开始计算的日期
/// @param formatString 日期字符串的格式,例如:yyyy年MM月dd日
+ (NSString *)formatDateBeforeWithTimeString:(NSString *)timeString
                                      format:(NSString *)formatString
{
    
    NSString *_createDate = @"";
    NSDate *toDate = [self getDateWithTimeString:timeString format:formatString];
    NSCalendar *calender =  [NSCalendar currentCalendar];
    NSDateComponents *dateComponents =  [calender components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:toDate toDate:[NSDate date] options:NSCalendarWrapComponents];
    if (dateComponents.year > 0) {
        _createDate = [NSString stringWithFormat:@"%ld年前",dateComponents.year];
    }else if (dateComponents.month > 0){
        _createDate = [NSString stringWithFormat:@"%ld月前",dateComponents.month];
    }else if (dateComponents.day > 0){
        _createDate = [NSString stringWithFormat:@"%ld天前",dateComponents.day];
    }else if (dateComponents.hour > 0){
        _createDate = [NSString stringWithFormat:@"%ld小时前",dateComponents.hour];
    }else if (dateComponents.minute > 0){
        _createDate = [NSString stringWithFormat:@"%ld分钟前",dateComponents.minute];
    }else if (dateComponents.second > 10){
        _createDate = [NSString stringWithFormat:@"%ld秒前",dateComponents.second];
    }else{
        _createDate = [NSString stringWithFormat:@"刚刚"];
    }
    return _createDate;
}

@end
