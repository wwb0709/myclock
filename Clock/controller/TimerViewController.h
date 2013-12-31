//
//  TimerViewController.h
//  myClock
//
//  Created by wangwb on 13-12-26.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController
{
    BOOL timeStart;
}
@property (strong, nonatomic) NSDate *today;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UILabel *timetitle;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;

- (IBAction)startorcancel:(id)sender;
- (IBAction)stoporcontinue:(id)sender;

@end
