//
//  ViewController.h
//  Clock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCycleScrollView.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController : UIViewController<XLCycleScrollViewDatasource,XLCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) XLCycleScrollView *csView;
@property (nonatomic)     SystemSoundID soundID;
@end
