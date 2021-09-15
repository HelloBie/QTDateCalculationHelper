//
//  ViewController.m
//  QTDateCalculationHelper
//
//  Created by MasterBie on 2020/7/22.
//  Copyright © 2020 MasterBie. All rights reserved.
//

#import "ViewController.h"
#import "QTDateCalculationHelper/QTDateCalculationHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString* time = @"20200229 000000";
    NSString* time2 = @"20210909 000000";
    NSString* format = @"yyyyMMdd hhmmss";
    NSLog(@"\n%@",[QTDateCalculationHelper getDateWithTimeString:time format:format]);
    NSLog(@"\n%ld",(long)[QTDateCalculationHelper getWeekNumberWithTime:time format:format]);
    NSLog(@"\n%ld",(long)[QTDateCalculationHelper getDaysAfterTime:time beforeTime:time2 format:format]);
    NSLog(@"\n%@",[QTDateCalculationHelper getTimeWithTimeString:time year:1 month:0 day:0 format:format]);
    NSLog(@"\n%@",[QTDateCalculationHelper getTimeWithTimeString:time hour:23 minute:60 second:0 format:format]);
    NSLog(@"\n%ld",(long)[QTDateCalculationHelper getMonthMaxDayWithTimeString:time format:format]);
    NSLog(@"\n%@",[QTDateCalculationHelper getTimeAfterWeekCountWithTimeString:time weekCount:3 format:format]);
   
}


@end
