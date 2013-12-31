//
//  ViewController.m
//  Clock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "ViewController.h"
#import "UTility.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor grayColor]];
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

   
   CGRect frame = self.view.bounds;
    frame.size.height =KCenterViewHeight;
    _csView = [[XLCycleScrollView alloc] initWithFrame:frame];
    _csView.delegate = self;
    _csView.datasource = self;
    
//    CALayer * layer = [_csView layer];
//    layer.borderColor = [[UIColor redColor] CGColor];
//    layer.borderWidth = 5.0f;
    
//    [self.view addSubview:_csView];
    
    
    
    
    _tableview = [[UITableView alloc] initWithFrame:frame];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.showsVerticalScrollIndicator = YES;
    _tableview.scrollsToTop = YES;
    
    [self.view addSubview:_tableview];

    
    
    UIButton *tmpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tmpBtn setFrame:CGRectMake(217,2,100,35)];
    [tmpBtn addTarget:self
               action:@selector(changeLayout:)
     forControlEvents:UIControlEventTouchUpInside];
    tmpBtn.backgroundColor=        [UIColor blueColor];
    [tmpBtn setTitle:NSLocalizedString(@"切换",nil) forState:UIControlStateNormal];
    [self.view addSubview:tmpBtn];
    
   
    NSString *path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &_soundID);
    
    CGRect rect = self.view.bounds;
    CGRect rect2 = self.view.frame;
    int i=0;
}

static BOOL showtableview = YES;
-(void)changeLayout:(id)sender
{
    AudioServicesPlaySystemSound (_soundID);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    _tableview.hidden = !_tableview.hidden;
//    
//    _csView.hidden = !_csView.hidden;
    if (showtableview) {
        
    }
    else
    {
    
    }
  
    [UIView transitionWithView:self.view
                      duration:1.2
                       options:UIViewAnimationOptionOverrideInheritedOptions
                    animations:^{
                        
                        if (showtableview) {
                            showtableview = NO;
                            [_tableview removeFromSuperview];
                            [self.view insertSubview:_csView atIndex:0];
                        }
                        else
                        {
                            showtableview = YES;
                            [_csView removeFromSuperview];
                            [self.view insertSubview:_tableview atIndex:0];
                        }

                    }
                    completion:NULL];
    
}
-(void)onBackButton:(id)sender
{
    NSLog(@"onBackButton");
    
    FirstViewController *add = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    
    [self.navigationController pushViewController:add animated:true];
    
}
-(void)onBackButton2:(id)sender
{
    NSLog(@"onBackButton2");
    
    FirstViewController *add = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    [self presentViewController:add animated:true completion:nil];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UTility tabBarHidden:NO belongView:self.view];
    CGRect rect = self.view.bounds;
    CGRect rect2 = self.view.frame;
    int i=0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfPages
{
    return 5;
}

- (UIView *)pageAtIndex:(NSInteger)index
{
    
    CGRect frame = self.view.bounds;
    frame.size.height =KCenterViewHeight;
    
    UILabel *l = [[UILabel alloc] initWithFrame:frame];
    l.text = [NSString stringWithFormat:@"%d",index];
    l.font = [UIFont systemFontOfSize:72];
    l.textAlignment = UITextAlignmentCenter;
    l.backgroundColor = [UIColor clearColor];
    return l;
}

- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"当前点击第%d个页面",index]
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];

}









#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
    return 5;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",row];
	return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	return 70;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger sectionIdx = [indexPath section];
	NSInteger row = [indexPath row];
	if (0==sectionIdx && 0==row) {
		return nil;
	}
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	NSInteger rowIdx = [indexPath row];
	NSInteger sectionIdx = [indexPath section];
	
    
	//取消选中状态
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [cell setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qipao_gray.png"]]];  //设置背景颜色
    NSInteger row = [indexPath row];
    if (row%2==0) {
        [cell setBackgroundColor:[UIColor grayColor]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor greenColor]];
    }
}



@end
