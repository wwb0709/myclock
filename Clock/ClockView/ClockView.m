//
//  ClockView.m
//  myClock
//
//  Created by wangwb on 13-12-24.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "ClockView.h"
#import "CommonsDefine.h"
@implementation ClockView
@synthesize angle =_angle;
@synthesize centerCircle =_centerCircle;
@synthesize radius =_radius;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _centerCircle =CGPointMake(frame.size.width/2, frame.size.height/2);
         self.backgroundColor =[UIColor clearColor];
        _angle =250.0f;
        _radius =45.0f;
        
    }
    return self;
}

-(void)setAngle:(float)angle{
    
    _angle =angle;
    
    [self setNeedsDisplay];
}

-(void)setRadius:(float)radius{
    
    _radius =radius;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    float segmen =0.8;
    
    float space =8.5f;
    
    CGPoint _p1 =CGPointMake(_centerCircle.x +_radius *segmen *sinf(TransformRadian(_angle)),
                             _centerCircle.y -_radius *segmen *cosf(TransformRadian(_angle)));
    
    CGPoint _p2 =CGPointMake(_centerCircle.x +space *sinf(TransformRadian(_angle +90.0f)),
                             _centerCircle.y -space *cosf(TransformRadian(_angle +90.0f)));
    
    CGPoint _p3 =CGPointMake(_centerCircle.x +space *sinf(TransformRadian(_angle +270.0f)),
                             _centerCircle.y -space *cosf(TransformRadian(_angle +270.0f)));
    
    CGPoint _p4 =CGPointMake(_centerCircle.x +_radius *(1 -segmen) *sinf(TransformRadian(_angle +180.0f)),
                             _centerCircle.y -_radius *(1 -segmen) *cosf(TransformRadian(_angle +180.0f)));
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, _p1.x, _p1.y);
    
    CGPathAddLineToPoint(path, NULL, _p2.x, _p2.y);
    CGPathAddLineToPoint(path, NULL, _p4.x, _p4.y);
    CGPathAddLineToPoint(path, NULL, _p3.x, _p3.y);
    CGPathAddLineToPoint(path, NULL, _p1.x, _p1.y);
    
    UIColor *fillColor =[UIColor colorWithWhite:0 alpha:1.0f];
    
    CGContextRef c = UIGraphicsGetCurrentContext();
	
    CGContextSetLineWidth(c, 0.2f);
    
	CGContextSetStrokeColorWithColor(c, [[UIColor colorWithWhite:0.5f alpha:1.0] CGColor]);
    
	CGContextSetFillColorWithColor(c, [fillColor CGColor]);
    
    CGContextAddPath(c, path);
    
	CGContextDrawPath(c, kCGPathFillStroke);
    
    /*
     CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
     CGFloat colors[] ={
     1.0, 1.0, 1.0, 0.4f,
     1.0, 1.0, 1.0, 0.15f
     };
     CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, 2);
     CGColorSpaceRelease(rgb);
     
     CGContextDrawLinearGradient(c, gradient, CGPointMake(0, 0), CGPointMake(0, rect.size.height/8), kCGGradientDrawsAfterEndLocation);
     
     CGGradientRelease(gradient);
     */
	CGPathRelease(path);
    
    
}

@end
