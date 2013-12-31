//
//  AppDelegate.h
//  Clock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UICustomizeTabBar;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) NSMutableArray * quanNaviTabBarArray;  //对应的导航矩阵
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UICustomizeTabBar * quanTabBar;  //自定义Tabbar标签
@end
