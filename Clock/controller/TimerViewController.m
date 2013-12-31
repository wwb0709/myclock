//
//  TimerViewController.m
//  myClock
//
//  Created by wangwb on 13-12-26.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

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
   _timetitle.text = [NSString stringWithFormat:@"%@:%@:%@",@"00",@"00",@"00"];
    
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat color[4] = {1,1,0,1};
    CGColorRef layerBounderColor = CGColorCreate(rgb, color);
    CGColorSpaceRelease(rgb);
    CALayer *viewLayer = _pickerView.layer;
    [viewLayer setBounds:CGRectMake(10, 0, 300, 300)];
    [viewLayer setBackgroundColor:layerBounderColor];
    [viewLayer setContentsRect:CGRectMake(0, 0, 100, 150)];
    [viewLayer setBorderWidth:20];
    [viewLayer setBorderColor:layerBounderColor];
//    viewLayer.contents = (__bridge id)(CGImageRef)[UIImage imageNamed:@"clock-background.png"].CGImage;
    CGColorRelease(layerBounderColor);

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

static BOOL isStart = YES;
- (IBAction)startorcancel:(id)sender {
    timeStart = YES;
//    [self timerFireMethod:_timer];
    if (isStart) {
        isStart = NO;
        _timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
        [_leftButton setTitle:@"取消" forState:UIControlStateNormal];
    }
    else
    {
         isStart = YES;
        [_timer invalidate];
        
        _timetitle.text = [NSString stringWithFormat:@"%@:%@:%@",@"00",@"00",@"00"];
         [_leftButton setTitle:@"开始计时" forState:UIControlStateNormal];
    }

    
//    [_timer setFireDate:[NSDate distantPast]];//开启
   
}
static BOOL istop = NO;
- (IBAction)stoporcontinue:(id)sender {
    timeStart = NO;
//     [_timer setFireDate:[NSDate distantPast]];//开启
    
//    [self timerFireMethod:_timer];
    if (istop) {
        istop = NO;
        [_timer setFireDate:[NSDate distantPast]];//开启
        [_rightButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
    else
    {
         [_timer setFireDate:[NSDate distantFuture]];//暂停
         [_rightButton setTitle:@"继续" forState:UIControlStateNormal];
        istop = YES;
     
    }
   
    
   
}


- (void)timerFireMethod:(NSTimer *)theTimer

{
    
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    
    NSDateComponents *endTime = [[NSDateComponents alloc] init];    //初始化目标时间...
    
    _today = [NSDate date];    //得到当前时间
    
    
    
    NSDate *date = [NSDate dateWithTimeInterval:120 sinceDate:_today];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    
    
    static int year;
    
    static int month;
    
    static int day;
    
    static int hour;
    
    static int minute;
    
    static int second;
    
    if(timeStart) {//从NSDate中取出年月日，时分秒，但是只能取一次
        
        year = [[dateString substringWithRange:NSMakeRange(0, 4)] intValue];
        
        month = [[dateString substringWithRange:NSMakeRange(5, 2)] intValue];
        
        day = [[dateString substringWithRange:NSMakeRange(8, 2)] intValue];
        
        hour = [[dateString substringWithRange:NSMakeRange(11, 2)] intValue];
        
        minute = [[dateString substringWithRange:NSMakeRange(14, 2)] intValue];
        
        second = [[dateString substringWithRange:NSMakeRange(17, 2)] intValue];
        
        timeStart= NO;
        
    }
    
    
    
    [endTime setYear:year];
    
    [endTime setMonth:month];
    
    [endTime setDay:day];
    
    [endTime setHour:hour];
    
    [endTime setMinute:minute];
    
    [endTime setSecond:second];
    
    NSDate *todate = [cal dateFromComponents:endTime]; //把目标时间装载入date
    
    
    
    
    
    //用来得到具体的时差，是为了统一成北京时间
    
    unsigned int unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit| NSHourCalendarUnit| NSMinuteCalendarUnit| NSSecondCalendarUnit;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:_today toDate:todate options:0];
    
    
    NSString *shi = [NSString stringWithFormat:@"%d", [d hour]];
    
    if([d hour] < 10) {
        
        shi = [NSString stringWithFormat:@"0%d",[d hour]];
        
    }

    
    NSString *fen = [NSString stringWithFormat:@"%d", [d minute]];
    
    if([d minute] < 10) {
        
        fen = [NSString stringWithFormat:@"0%d",[d minute]];
        
    }
    
    NSString *miao = [NSString stringWithFormat:@"%d", [d second]];
    
    if([d second] < 10) {
        
        miao = [NSString stringWithFormat:@"0%d",[d second]];
        
    }
    
    
    if([d second] > 0) {
        
        
        _timetitle.text = [NSString stringWithFormat:@"%@:%@:%@",shi,fen,miao];
        //计时尚未结束，do_something
        
        
    } else if([d second] == 0) {
        
        
        _timetitle.text = @"计时1分钟结束";
        //计时1分钟结束，do_something
        
        [_timer setFireDate:[NSDate distantFuture]];//暂停
        
    } else{
         _timetitle.text = @"end";
        [theTimer invalidate];
        
    }
    
    
    
}





- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 2;     //这个picker里的组键数
    
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    return 5;  //数组个数
    
}

#pragma mark -

#pragma mark UIPickerViewDelegate

/************************重头戏来了************************/

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    
    UILabel *myView = nil;
    
    if (component == 0) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = UITextAlignmentCenter;
        
        myView.text = [NSString stringWithFormat:@"%d",row];//[pickerNameArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }else {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)];
        
        myView.text = [NSString stringWithFormat:@"%d",row];
        
        myView.textAlignment = UITextAlignmentCenter;
        
        myView.font = [UIFont systemFontOfSize:14];
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    
    return myView;
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
    
    CGFloat componentWidth = 0.0;
    
    if (component == 0)
        
        componentWidth = 100.0; // 第一个组键的宽度  
    
    else
        
        componentWidth = 180.0; // 第2个组键的宽度
    
    return componentWidth;
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component

{
    
    return 40.0;
    
}




@end
