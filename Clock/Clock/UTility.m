//
//  UTility.m
//  myClock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "UTility.h"
#import "AppDelegate.h"
#import "UICustomizeTabBar.h"

@implementation UTility
//自定义标签栏的隐藏和显示,使用全局方式还是，嵌入到视图内部的方式
+ (void) tabBarHidden : (BOOL)hidden
           belongView : (UIView *)belongView
{
    //    [DAUtility tabBarHidden2 :hidden
    //                  belongView : belongView];
    //    return;
   	AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
//	if ( CustomTabBarType_Quan==appDelegate.forgroundTabBarType)
//	{
		appDelegate.quanTabBar.hidden = hidden;
        if (NO==hidden)
        {
            NSInteger tabY = belongView.frame.size.height - kUITabBarHeight;
            [appDelegate.quanTabBar setFrame:CGRectMake(0, tabY, 320, kUITabBarHeight)];
            [belongView addSubview:appDelegate.quanTabBar];
        }
        if (YES==hidden)
        {
            NSInteger tabY = belongView.frame.size.height + kUITabBarHeight;
            [appDelegate.quanTabBar setFrame:CGRectMake(0, tabY, 320, kUITabBarHeight)];
        }
        
//	}
    
}


//启动闹钟
- (void)startClock:(int)clockID
{
	//首先查找以前是否存在此本地通知,若存在,则删除以前的该本地通知,
	//再重新发出新的本地通知
	
	[self shutdownClock:clockID];
	
	NSString *clockIDString = [NSString stringWithFormat:@"%d", clockID];
	[UTility postLocalNotification:clockIDString isFirst:YES];
    
}

//关闭闹钟
- (void)shutdownClock:(int)clockID
{
	NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
	for(UILocalNotification *notification in localNotifications)
	{
		if ([[[notification userInfo] objectForKey:@"ActivityClock"] intValue] == clockID) {
			NSLog(@"Shutdown localNotification:%@", [notification fireDate]);
			[[UIApplication sharedApplication] cancelLocalNotification:notification];
		}
	}
}

//根据参数设置本地提醒
+ (void)postLocalNotification:(NSString *)clockID isFirst:(BOOL)flag
{
//	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	//-----获取闹钟数据---------------------------------------------------------
	NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
	NSMutableDictionary *clockDictionary = [userDefault objectForKey:clockID];
	
	NSString *clockTime = [clockDictionary objectForKey:@"ClockTime"];
	NSString *clockMode = [clockDictionary objectForKey:@"ClockMode"];
	//NSString *clockScene = [clockDictionary objectForKey:@"ClockScene"];
	NSString *clockMusic = [clockDictionary objectForKey:@"ClockMusic"];
	NSString *clockRemember = [clockDictionary objectForKey:@"ClockRemember"];
	//-----组建本地通知的fireDate-----------------------------------------------
	
	//------------------------------------------------------------------------
	NSArray *clockTimeArray = [clockTime componentsSeparatedByString:@":"];
	NSDate *dateNow = [NSDate date];
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	//[calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    //[comps setTimeZone:[NSTimeZone timeZoneWithName:@"CMT"]];
	NSInteger unitFlags = NSEraCalendarUnit |
	NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit |
	NSWeekCalendarUnit |
	NSWeekdayCalendarUnit |
	NSWeekdayOrdinalCalendarUnit |
	NSQuarterCalendarUnit;
	
	comps = [calendar components:unitFlags fromDate:dateNow];
	[comps setHour:[[clockTimeArray objectAtIndex:0] intValue]];
	[comps setMinute:[[clockTimeArray objectAtIndex:1] intValue]];
	[comps setSecond:0];
	
	//------------------------------------------------------------------------
	Byte weekday = [comps weekday];
	NSArray *array = [[clockMode substringFromIndex:1] componentsSeparatedByString:@"、"];
	Byte i = 0;
	Byte j = 0;
	int days = 0;
	int	temp = 0;
	Byte count = [array count];
	Byte clockDays[7];
	
	NSArray *tempWeekdays = [NSArray arrayWithObjects:@"日", @"一", @"二", @"三", @"四", @"五", @"六", nil];
	//查找设定的周期模式
	for (i = 0; i < count; i++) {
		for (j = 0; j < 7; j++) {
			if ([[array objectAtIndex:i] isEqualToString:[tempWeekdays objectAtIndex:j]]) {
				clockDays[i] = j + 1;
				break;
			}
		}
	}
	
	for (i = 0; i < count; i++) {
	    temp = clockDays[i] - weekday;
		days = (temp >= 0 ? temp : temp + 7);
		NSDate *newFireDate = [[calendar dateFromComponents:comps] dateByAddingTimeInterval:3600 * 24 * days];
		
		UILocalNotification *newNotification = [[UILocalNotification alloc] init];
		if (newNotification) {
			newNotification.fireDate = newFireDate;
			newNotification.alertBody = clockRemember;
			newNotification.soundName = [NSString stringWithFormat:@"%@.caf", clockMusic];
			newNotification.alertAction = @"查看闹钟";
			newNotification.repeatInterval = NSWeekCalendarUnit;
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:clockID forKey:@"ActivityClock"];
			newNotification.userInfo = userInfo;
			[[UIApplication sharedApplication] scheduleLocalNotification:newNotification];
		}
		NSLog(@"Post new localNotification:%@", [newNotification fireDate]);
	
		
	}

}

@end
