//
//  ClockViewController.h
//  myClock
//
//  Created by wangwb on 13-12-24.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ClockView;
@interface ClockViewController : UIViewController
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) ClockView* clockview;
@end
