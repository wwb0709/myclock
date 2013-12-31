//
//  AlarmclockViewController.m
//  myClock
//
//  Created by wangwb on 13-12-30.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "AlarmclockViewController.h"
#import "AlarmClockCell.h"
@interface AlarmclockViewController ()

@end

@implementation AlarmclockViewController

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


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//UITableViewCellStyle style = UITableViewCellStyleDefault;
	AlarmClockCell *cell;
//	if (indexPath.row == 0) {
//		cell = (AddClockViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AddClockViewCell"];
//		if (!cell) {
//			cell = [[[NSBundle mainBundle] loadNibNamed:@"AddClockViewCell" owner:self options:nil] lastObject];
//		}
//		((AddClockViewCell *)cell).delegate = self;
//	}
//	else
    {
		cell = (AlarmClockCell *)[tableView dequeueReusableCellWithIdentifier:@"AlarmClockCell"];
		if (!cell) {
			cell =[[[NSBundle mainBundle] loadNibNamed:@"AlarmClockCell" owner:self options:nil] lastObject];
		}
//		((AlarmClockCell *)cell).delegate = self;
		
//		NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//		NSMutableDictionary *clockDictionary = [userDefault objectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
//		((ClockCell *)cell).clockSwitch.on = [[clockDictionary objectForKey:@"ClockState"] isEqualToString:@"开启"] ? YES : NO;
//		((ClockCell *)cell).clockTimeLabel.text = [clockDictionary objectForKey:@"ClockTime"];
//		((ClockCell *)cell).clockModeLabel.text = [clockDictionary objectForKey:@"ClockMode"];
//		((ClockCell *)cell).clockSceneLabel.text = [clockDictionary objectForKey:@"ClockScene"];
//		((ClockCell *)cell).clockMusic = [clockDictionary objectForKey:@"ClockMusic"];
//		((ClockCell *)cell).clockRemember = [clockDictionary objectForKey:@"ClockRemember"];
//		((ClockCell *)cell).numberID = indexPath.row;
//		[((ClockCell *)cell) setUIFontAndColor];
        
        cell.mytitle.text =NSLocalizedStringFromTable(@"China", @"AlarmClockCell", nil);
        NSLog(@"Local string1: %@", NSLocalizedStringFromTable(@"China", @"AlarmClockCell", nil));
	}
	return cell;
}

@end
