//
//  ViewController.m
//  QTDateCalculationHelper
//
//  Created by MasterBie on 2020/7/22.
//  Copyright © 2020 MasterBie. All rights reserved.
//

#import "ViewController.h"
#import "QTDateCalculationHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString*time = @"20200229 000000";
    NSLog(@"%@",[QTDateCalculationHelper getTimeWithBeginTime:time withYears:1]);
}


@end
