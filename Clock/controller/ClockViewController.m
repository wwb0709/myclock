//
//  ClockViewController.m
//  myClock
//
//  Created by wangwb on 13-12-24.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "ClockViewController.h"
#import "ClockView.h"
#import "DDClockView.h"
#import "User.h"
@interface ClockViewController ()

@end

@implementation ClockViewController

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
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    
//   CGRect frame = self.view.frame;
//   _clockview =[[ClockView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//
//    [self.view addSubview:_clockview];
//    
//    [self doIt];
//    
//    [self startTimer];
    
    
    

    
    //取得目前已知的所有地里名称
    NSArray *timeZoneNames = [NSTimeZone knownTimeZoneNames];
    
    //取得本地目前时间
    NSDate *date = [NSDate date];
    
    
    NSDateFormatter * formatter =   [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
    [formatter setTimeZone:timeZone];
    NSString *loctime = [formatter stringFromDate:date];
    
      NSLog(@"---bj 当地时间：%@", loctime);
    
    for(NSString *name in timeZoneNames) {
        NSTimeZone *timezone = [[NSTimeZone alloc] initWithName:name];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        //设定时间格式
        [formatter setDateFormat:@"YYYY-MM-d HH:mm:ss"];
        
        //设定时区
        [formatter setTimeZone:timezone];
        
        //时间格式正规化并做时区校正
        NSString *correctDate = [formatter stringFromDate:date];
        
        NSLog(@"地点：%@ 当地时间：%@",[timezone name], correctDate);

    }
    
    
    
    DDClockView *clockView =[[DDClockView alloc] initWithFrame:CGRectMake(60, 150, 300, 300)];
   

    
    clockView.center =self.view.center;
    [self.view addSubview:clockView];
    
    
    self.navigationController.navigationBar.hidden = true;
    
    
    
    
    User *user = [[User alloc] init];
    user.name = @"hello";
    user.age = 22;
    user.favs = @[@"1",@"2",@"3"];
    user.info = @{@"1":@"2",@"2":@"2"};
    
    User *user2 = [[User alloc] init];
    user2.name = @"hello";
    user2.age = 23;
    user2.favs = @[@"1",@"2",@"3"];
    user2.info = @{@"1":@"2",@"2":@"2"};
    [user2 insertToDb];
    // 插入到数据库
    if ([user insertToDb]) {
        
        NSMutableArray *_users = [User allDbObjects];
        User *user =[_users objectAtIndex:1];
        
        
        NSArray *favs = user.favs;
        NSDictionary *info = user.info;
        
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UTility tabBarHidden:NO belongView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)startTimer{
    
    _timer =[NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(doIt)
                                           userInfo:nil
                                            repeats:YES];
}
-(void)doIt{
    NSDate *currentDate =[NSDate date];
    
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSSecondCalendarUnit |NSMinuteCalendarUnit | NSHourCalendarUnit;
	NSDateComponents *comps = [gregorian components:unitFlags fromDate:currentDate];

    
	int seconds = [comps second];
    int minute =[comps minute];
    int hour =[comps hour];
    
    float angleOfSecond =seconds * 6.0f;
    
    float angleOfMinute =(minute +seconds/60.0f ) *6.0f;
    
    float angleOfHour = (hour%12)*30.0f + ((minute +seconds/60.0f )/60.0f)*30.0f;
    
    [_clockview setAngle:angleOfSecond];
    
//    [_viewOfMinuteNeedle setAngle:angleOfMinute];
//    
//    [_viewOfHourNeedle setAngle:angleOfHour];
}


@end
