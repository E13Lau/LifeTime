//
//  LifeTimeViewController.m
//  LifeTime
//
//  Created by command.Zi on 14-5-25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "LifeTimeViewController.h"

@interface LifeTimeViewController ()

@end

@implementation LifeTimeViewController
@synthesize datePicker;
NSDate *selecteddate;
NSDate *now;

- (void)viewDidLoad
{
    [super viewDidLoad];
    now = [NSDate date];
    [datePicker setDate:now animated:YES];
    [datePicker addTarget:self action:@selector(dateChanged:)
         forControlEvents:UIControlEventValueChanged];
    self.overDayTime.text = [self getOverDaytime];
    [NSTimer scheduledTimerWithTimeInterval:100.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
//    [NSTimer scheduledTimerWithTimeInterval:1.0 invocation:@"a" repeats:YES];
    self.overLifeTime.text = @"请选择日期";
    self.overTime.text = @"请选择日期";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dateChanged:(UIDatePicker *)mdatePicker
{
    selecteddate = mdatePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:selecteddate];
    self.birthday.text = destDateString;
    if ([self getOverLifeTiem] < 0 ) {
        NSString *a = [NSString stringWithFormat:@"%ld 天之前",-[self getOverLifeTiem]];
        self.overTime.text = a;
    }else {
        NSString *a = [NSString stringWithFormat:@"%ld 天之后",[self getOverLifeTiem]];
        self.overTime.text = a;
    }
}

-(void)timerFireMethod:(NSTimer*)theTimer
{
    self.overDayTime.text = [self getOverDaytime];
    NSLog(@"1");
}

#pragma mark 计算操作
-(NSString *)getOverDaytime
{
    //    NSDate *newdate = [NSDate date];//等效NSDate *today = [[NSDate alloc]init];
    
    NSDate *today = [[NSDate alloc]init];
    //获取当前小时＊60+分钟＝所有分钟；
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:today];
    NSInteger hour = [dateComponent hour];
    NSInteger minute = [dateComponent minute];
    //24*60-所有分钟＝剩余
    NSInteger overTime = 1440-(hour*60+minute);
    if (overTime == 0) {
        return @"新的开始";
    }else {
        float overTime1 = round(((float)overTime/1440) * 100.0)/100.0;
        NSString *stringovertime = [NSString stringWithFormat:@"今天还有 %0.2f 天",overTime1];
        return stringovertime;
    }
}

-(NSInteger)getOverLifeTiem
{
    NSTimeInterval time=[selecteddate timeIntervalSinceNow];
    NSInteger a = (time/(3600*24));
    return a;
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger Life = 32871;
    Life = Life-(-[self getOverLifeTiem]);
    if (Life >= 32871) {
        self.overLifeTime.text = @"希望在明天";
    }else {
        self.overLifeTime.text = [NSString stringWithFormat:@" Life 还有 %ld 天",Life];
    }
}

@end
