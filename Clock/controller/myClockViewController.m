//
//  myClockViewController.m
//  myClock
//
//  Created by wangwb on 13-12-25.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "myClockViewController.h"
#import "myClockView.h"
@interface myClockViewController ()

@end

@implementation myClockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect frame = self.view.bounds;

    frame.size.height =320;

    _clockView = [[myClockView alloc] initWithFrame:frame];
	[_clockView setClockBackgroundImage:[UIImage imageNamed:@"clock-background.png"].CGImage];
	[_clockView setHourHandImage:[UIImage imageNamed:@"clock-hour-background.png"].CGImage];
	[_clockView setMinHandImage:[UIImage imageNamed:@"clock-min-background.png"].CGImage];
	[_clockView setSecHandImage:[UIImage imageNamed:@"clock-sec-background.png"].CGImage];
//    _clockView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
	[self.view addSubview:_clockView];
    CGPoint point = self.view.center;
//    ceilf((self.view.bounds.size.height - 320)/2);
//    CGPoint point = CGPointMake(320/2, ceilf((self.view.bounds.size.height - 320)/2));
    _clockView.center = point;
//    _clockView.center =self.view.center;
    

    
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor =[UIColor redColor];
    self.navigationController.navigationBar.TintColor =[UIColor greenColor];
    //    self.navigationController.navigationBar.hidden = true;
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"dilan.png"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             
                                             initWithTitle: NSLocalizedString(@"push view", @"")
                                             
                                             style:UIBarButtonItemStyleDone
                                             
                                             target:self
                                             
                                             action:@selector(onBackButton:)]
    ;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              
                                              initWithTitle: NSLocalizedString(@"present view", @"")
                                              
                                              style:UIBarButtonItemStyleDone
                                              
                                              target:self
                                              
                                              action:@selector(onBackButton2:)]
    
    ;
    
    CGRect rect = self.view.bounds;
    CGRect rect2 = self.view.frame;
    int i=0;
    
//    self.navigationController.navigationBar.hidden = true;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    
    CGRect rect = self.view.bounds;
    CGRect rect2 = self.view.frame;
    
    
    
 
    CGPoint point = CGPointMake(320/2, ceilf((self.view.bounds.size.height)/2));
    _clockView.center = point;

    [UTility tabBarHidden:NO belongView:self.view];
	//start the clock at current time
	[_clockView start];

}

- (void)viewWillDisappear:(BOOL)animated
{
	//stop the clock
	[_clockView stop];
}


@end
