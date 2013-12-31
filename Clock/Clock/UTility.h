//
//  UTility.h
//  myClock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTility : NSObject
+ (void) tabBarHidden : (BOOL)hidden
           belongView : (UIView *)belongView;
+ (void)postLocalNotification:(NSString *)clockID isFirst:(BOOL)flag;
@end
