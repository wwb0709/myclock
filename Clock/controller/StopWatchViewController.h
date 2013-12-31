//
//  StopWatchViewController.h
//  myClock
//
//  Created by wangwb on 13-12-26.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopWatchViewController : UIViewController
{
    BOOL checked;
    float time;
    float time_lap;
    dispatch_source_t _mtimer;
}
- (IBAction)startOrstop:(id)sender;
- (IBAction)resetOrLap:(id)sender;
@property (strong, nonatomic)NSTimer* timer;
@property (strong, nonatomic)NSString* timestr;
@property (strong, nonatomic)NSString* timestr_lap;
@property (strong, nonatomic)NSArray* list_time;
@property (strong, nonatomic)NSArray* list_lap;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UIButton *leftBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightBtn;

@property (strong, nonatomic) IBOutlet UILabel *label;

@end
