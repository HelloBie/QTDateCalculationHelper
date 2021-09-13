//
//  QTDateCalculationHelper.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/29.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// NSDate 相关工具
@interface QTDateCalculationHelper : NSObject


#pragma mark 字符串与NSDate之间转换 ↓↓↓

/// =============== 将字符串转为NSDate对象 ===============
/// @param timeString 时间字符串
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日
+(NSDate *)getDateWithTimeString:(NSString *)timeString
                          format:(NSString *)formatString;

/// =============== 将NSDate对象转换为字符串 ===============
/// @param date 时间对象
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日
+(NSString *)getTimeStringWithDate:(NSDate *)date
                          format:(NSString *)formatString;


#pragma mark 常用方法 ↓↓↓
/// =============== 获取当前时间字符串 ===============
/// @param formatString 时间格式,例如:yyyy年MM月dd日
+ (NSString *)getNowDateStringWithFormat:(NSString *)formatString;



/// =============== 获取目标日期星期几 ===============
/// @param timeString 目标时间,字符串类型
/// @param formatString 解析时间字符串的格式,例如:yyyy年MM月dd日
+ (NSInteger)getWeekNumberWithTime:(NSString *)timeString
                            format:(NSString *)formatString;

/// 获取月份天数
/// @param timeString 目标时间字符串
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月
+ (NSInteger)getMonthMaxDayWithTimeString:(NSString *)timeString
                                   format:(NSString *)formatString;

#pragma mark - 日期计算 ↓↓↓


/// =============== 计算与今天相隔几天,正数今天之后,负数今天之前 ===============
/// @param timeString 目标时间,字符串类型
/// @param formatString 解析目标时间的格式,例如:yyyy年MM月dd日
+ (NSInteger)daysWithTime:(NSString *)timeString
                  format:(NSString *)formatString;


/// =============== 计算两个时间相差几天 ===============
/// @param firstTimeString 第一个时间字符串
/// @param lastTimeString 第二个时间字符串
/// @param formatString 解析时间字符串的格式,例如:yyyy年MM月dd日
+ (NSInteger)getDaysAfterTime:(NSString *)firstTimeString
                  beforeTime:(NSString *)lastTimeString
                      format:(NSString *)formatString;

/// =============== 计算n周后的时间 ===============
/// @param timeString 开始计算的日期
/// @param weekCount 要计算几个星期
/// @param formatString 日期字符串的格式,例如:yyyy年MM月dd日
+ (NSString *)getTimeAfterWeekCountWithTimeString:(NSString *)timeString
                                        weekCount:(NSInteger)weekCount
                                           format:(NSString *)formatString;

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
                             format:(NSString *)formatString;


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
                             format:(NSString *)formatString;



/// =============== 将时间文字转换成多久之前文字 ===============
/// @param timeString 开始计算的日期
/// @param formatString 日期字符串的格式,例如:yyyy年MM月dd日
+ (NSString *)formatDateBeforeWithTimeString:(NSString *)timeString
                                      format:(NSString *)formatString;

@end

NS_ASSUME_NONNULL_END
