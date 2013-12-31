//
//  FirstViewController.m
//  myClock
//
//  Created by wangwb on 13-12-23.
//  Copyright (c) 2013年 wangwb. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    
    
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"iphone.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    //设置UIImage可接受交互
    imageView.userInteractionEnabled = YES;
    
    CALayer * layer = [imageView layer];
    layer.borderColor = [[UIColor whiteColor] CGColor];
    layer.borderWidth = 5.0f;
    
    [imageView setFrame:CGRectMake(20, 20, 200, 200)];
    [self.view addSubview:imageView];
  
    
    /*
     *  轻拍手势
     
     //  轻拍 单击
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
     
     //  单击
     tap.numberOfTapsRequired = 1;
     //  试图添加一个手势，UIView的方法
     [imageView addGestureRecognizer:tap];
     [tap release];
     
     //  轻拍 双击
     UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1:)];
     
     //  双击
     tap1.numberOfTapsRequired = 2;
     //  试图添加一个手势，UIView的方法
     [imageView addGestureRecognizer:tap1];
     [tap1 release];
     */
    
//    
//    /*
//     *  拖拽手势
//       */
//     UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//     [imageView addGestureRecognizer:pan];
//    
//    
//    
//    /*
//     *  捏合手势
//       */
//     UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
//     [imageView addGestureRecognizer:pinch];
//
//     
//   
//    
//    /*
//     *  旋转手势
//       */
//     
//     UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
//     [imageView addGestureRecognizer:rotation];
    
   
    
    /*
     *  轻扫手势
     
      */
     UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
     //设置轻扫方向
     swipe.direction = UISwipeGestureRecognizerDirectionDown;
     [imageView addGestureRecognizer:swipe];

    
    
    /*
     *  长按手势
     */
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [imageView addGestureRecognizer:longPress];
    longPress.minimumPressDuration = 1.0;

    
    CGRect rect = self.view.bounds;
    CGRect rect2 = self.view.frame;
    int i=0;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    CGRect rect = self.view.bounds;
    CGRect rect2 = self.view.frame;
     int i=0;
}

//   轻拍手势响应单击方法
-(void) tap:(UITapGestureRecognizer *) tap
{
    NSLog(@"是否相应 Tap ！");
}

//  轻拍手势响应双击方法
-(void) tap1:(UITapGestureRecognizer *) tap
{
    //  随机颜色
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha: 1.0];
    
    self.view.backgroundColor = randomColor;
}

//  拖拽手势响应事件
-(void) pan:(UIPanGestureRecognizer *) pan
{
    CGPoint point = [pan translationInView:pan.view];
    NSLog(@"point = %@", NSStringFromCGPoint(point));
    NSLog(@"center = %@", NSStringFromCGPoint(pan.view.center));
    pan.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
}

//  捏合手势响应事件
-(void) pinch:(UIPinchGestureRecognizer *)pinch
{
    pinch.view.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale);
}

//  旋转响应事件
-(void) rotation:(UIRotationGestureRecognizer *) rotation
{
    //  旋转是多少弧度
    rotation.view.transform = CGAffineTransformMakeRotation(rotation.rotation);
}

//  轻扫手势响应事件
-(void) swipe:(UISwipeGestureRecognizer*) swipe
{
    //  随机颜色
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha: 1.0];
    
    self.view.backgroundColor = randomColor;
}

//  长按手势响应事件
-(void) longPress:(UILongPressGestureRecognizer*) longPress
{
    if(longPress.state == UIGestureRecognizerStateEnded)
    {
        //  随机颜色
        UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha: 1.0];
        
        self.view.backgroundColor = randomColor;
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentview:(id)sender {
    
//     [self.navigationController dismissModalViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:true completion:^(void){
        
        // Code
        
        
        
    }];
}
@end
