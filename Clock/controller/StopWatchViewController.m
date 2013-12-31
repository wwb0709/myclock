//
//  StopWatchViewController.m
//  myClock
//
//  Created by wangwb on 13-12-26.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "StopWatchViewController.h"

@interface StopWatchViewController ()

@end

@implementation StopWatchViewController

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
    _timestr = [NSString stringWithFormat:@"00:00.0"];
    [_label setText:_timestr];
    
    
    checked = NO;
    NSString *titlel = (checked) ? (@"Stop") : (@"Start");
    [_leftBtn setTitle:titlel forState:UIControlStateNormal];
    NSString *titler = (checked) ? (@"Lap") : (@"Reset");
    [_rightBtn setTitle:titler forState:UIControlStateNormal];
    checked = YES;
    
    
    //间隔还是2秒
    
    uint64_t interval = 0.1 * NSEC_PER_SEC;
    
    //创建一个专门执行timer回调的GCD队列
    
    dispatch_queue_t queue = dispatch_queue_create("my queue", 0);
    
    //创建Timer
    
    _mtimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //使用dispatch_source_set_timer函数设置timer参数
    
    dispatch_source_set_timer(_mtimer, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    
    //设置回调
    
    dispatch_source_set_event_handler(_mtimer, ^()
                                      
                                      {
                                        dispatch_async(dispatch_get_main_queue(), ^(){

                                         [self updateTime];
                                            
                                        });
                                         
                                          NSLog(@"Timer %@", [NSThread currentThread]);
                                          
                                      });
    
  
}
- (void)viewWillAppear:(BOOL)animated
{
    [UTility tabBarHidden:NO belongView:self.view];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startOrstop:(id)sender {

    //点击切换按钮背景图
//    UIImage *newImage = (checked) ? [UIImage imageNamed:@"red.png"] : [UIImage imageNamed:@"green.png"];
//    [_leftBtn setBackgroundImage:newImage forState:UIControlStateNormal];
    

    NSString *titlel = (checked) ? (@"Stop") : (@"Start");
    [_leftBtn setTitle:titlel forState:UIControlStateNormal];
    NSString *titler = (checked) ? (@"Lap") : (@"Reset");
    [_rightBtn setTitle:titler forState:UIControlStateNormal];
   
    
    if (checked)   //start
    {
        dispatch_resume(_mtimer);
    }
    else
    {
        dispatch_suspend(_mtimer);
    }
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_async(queue, ^{
//       
//        if (checked)   //start
//        {
////            _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
//            dispatch_async(dispatch_get_main_queue(), ^(){
//                
//             [self updateTime];
//                
//            });
//           
//        }else {        //stop
//            [_timer invalidate];
//        }
//
//    });
    
    


     checked = !checked;
}

- (IBAction)resetOrLap:(id)sender {
    static NSInteger count = 1;
    
    if (checked) //reset
    {
        time = time_lap = 0.0;
        _timestr = [NSString stringWithFormat:@"00:00.0"];
        [_label setText:_timestr];
        _list_time = _list_lap = nil;
        count = 1;
        [_tableview reloadData];
        
    }else {      //lap
        if (_list_time == nil) {
            _list_time = [[NSArray alloc]initWithObjects:_timestr_lap, nil];
            _list_lap = [[NSArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",count++], nil];
        }else {
#if 0
            [list arrayByAddingObject:timestr];
#else
            NSArray *array = [[NSArray alloc]initWithObjects:_timestr_lap, nil];
            _list_time = [array arrayByAddingObjectsFromArray:_list_time];
            array = [[NSArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",count++], nil];
            _list_lap = [array arrayByAddingObjectsFromArray:_list_lap];
#endif
        }
        time_lap = 0;
        [_tableview reloadData];
    }
//    NSString *titlel = (checked) ? (@"Stop") : (@"Start");
//    [_leftBtn setTitle:titlel forState:UIControlStateNormal];
//    NSString *titler = (checked) ? (@"Lap") : (@"Reset");
//    [_rightBtn setTitle:titler forState:UIControlStateNormal];

}


- (float) updateTime
{
    time+=0.1;
    time_lap +=0.1;
    _timestr = [NSString stringWithFormat:@"%02d:%04.1f",(int)(time / 60) ,time - ( 60 * (int)( time / 60 ) )];
    _timestr_lap = [NSString stringWithFormat:@"%02d:%04.1f",(int)(time_lap / 60) ,time_lap - ( 60 * (int)( time_lap / 60 ) )];
    [_label setText:_timestr];
    return time;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_list_time count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableViewIdentifier = @"tableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableViewIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    cell.detailTextLabel.text = [_list_time objectAtIndex:row];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:25.0];
    cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
    
    NSString *text = [[NSString alloc]initWithFormat:@"lap %@", [_list_lap objectAtIndex:row]];
    cell.textLabel.text = text;
    return cell;
}
@end
