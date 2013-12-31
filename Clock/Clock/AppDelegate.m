//
//  AppDelegate.m
//  Clock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "AppDelegate.h"
#import "UICustomizeTabBar.h"
#import "ViewController.h"
#import "ClockViewController.h"
#import "myClockViewController.h"
#import "StopWatchViewController.h"
#import "TimerViewController.h"
#import "AlarmclockViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
//    //初始化label
//    
//    UILabel *label = [[UILabel alloc] init];
//    
//    NSString *text = @"这是一个测试！11111111！。";
//    
//    label.text = text;
//    label.textColor = [UIColor whiteColor];
//    
//    [label setNumberOfLines:0];
//    
//    UIFont *font = [UIFont fontWithName:@"Arial" size:14];
//    
//    //设置字体
//    
//    label.font = font;
//    
//    CGSize constraint = CGSizeMake(300, 20000.0f);
//    
//    CGSize size = [text sizeWithFont:font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//    
//    [label setFrame:CGRectMake(10, 0, size.width, size.height)];
//    
//    [self.window addSubview:label];
    
    
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    AlarmclockViewController* _viewController = [[AlarmclockViewController alloc] init];
   UINavigationController* _navController = [[UINavigationController alloc]
                      initWithRootViewController:_viewController];

    
    myClockViewController* _viewController2 = [[myClockViewController alloc] init];
    UINavigationController* _navController2 = [[UINavigationController alloc]initWithRootViewController:_viewController2];
    
    StopWatchViewController* _viewController3 = [[StopWatchViewController alloc] initWithNibName:@"StopWatchViewController" bundle:nil];
    UINavigationController* _navController3 = [[UINavigationController alloc]initWithRootViewController:_viewController3];
    
    
    TimerViewController* _viewController4 = [[TimerViewController alloc] initWithNibName:@"TimerViewController" bundle:nil];
    UINavigationController* _navController4 = [[UINavigationController alloc]initWithRootViewController:_viewController4];
    
    
    NSMutableArray * tmpArr = [[NSMutableArray alloc] init];
    self.quanNaviTabBarArray = tmpArr;


	[self.quanNaviTabBarArray addObject:_navController];
    [self.quanNaviTabBarArray addObject:_navController2];
    [self.quanNaviTabBarArray addObject:_navController3];
    [self.quanNaviTabBarArray addObject:_navController4];
    
    UICustomizeTabBar * tmpTabBarView = [[UICustomizeTabBar alloc] init];
	self.quanTabBar = tmpTabBarView;

    [self.quanTabBar showTabbarStack:nil];

    
    
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
