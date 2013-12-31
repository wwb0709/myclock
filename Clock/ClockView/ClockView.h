//
//  ClockView.h
//  myClock
//
//  Created by wangwb on 13-12-24.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockView : UIView
{
    float _angle;
    
    float _radius;
    
    CGPoint _centerCircle;

}


@property (nonatomic,assign) float angle;
@property (nonatomic,assign) float radius;
@property (nonatomic,assign) CGPoint centerCircle;


@end
