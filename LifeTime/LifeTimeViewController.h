//
//  LifeTimeViewController.h
//  LifeTime
//
//  Created by command.Zi on 14-5-25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeTimeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *overDayTime;
@property (weak, nonatomic) IBOutlet UILabel *overTime;
@property (weak, nonatomic) IBOutlet UILabel *overLifeTime;

@end
