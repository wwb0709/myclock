//
//  UICustomizeTabBar.m
//  LianLuoQuan
//
//  Created by tian kai on 11-4-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICustomizeTabBar.h"
#import "AppDelegate.h"
//#import "UINavigationBarCustomImage.h"


#define GLOW_ANIMATION_TIME 0.25
#define GLOW_IMAGE_WIDTH     80
#define GLOW_IMAGE_HEIGHT    50
#define GLOW_LEFT_GAP       ((kTabbarImageWidth_4-GLOW_IMAGE_WIDTH)/2)

@implementation UICustomizeTabBar

@synthesize _tabBarView;
//@synthesize curTabBarType;
@synthesize curSelectIdx;
@synthesize preSelectIdx;
@synthesize badgeView;
@synthesize badgeString;
@synthesize glowView;

#pragma mark --
#pragma mark 用户方法

//模态状态检测，只要有一个Tabbar的视图中，是模态状态，则不能进行切换操作
- (BOOL) canSwith : (id)sender
{
	BOOL isModalStatus = NO;
	if (NO==isModalStatus) {
		return YES;
	}else {
		return NO;
	}

}

//-(void)setBadge:(NSNotification*) notification
//{
//    NSArray *arr = [notification object];//获取到传递的对象
//
//    if ([arr count]>1) {
//        BOOL hidden = ([[arr objectAtIndex:1] isEqualToString: @"0"] )? YES:NO;
//        if (hidden) {
//             [CacheUtil cacheItems:@"1" for:@"setBadgeHidden"];
//        }
//        [self showBadge:[arr objectAtIndex:0] hidden:hidden];
//    }
//   
//}
//
////显示徽章
//- (void) showBadge : (NSString*)newBadgeString
//			hidden : (BOOL)hidden
//{
//    if ([self.badgeString isEqualToString:newBadgeString]) 
//        return;
//    
//    
//	self.badgeView.hidden = hidden;
//	self.badgeString = newBadgeString;
//
//	
//	UIView * tmpBtn1 = [self viewWithTag:kTabbar_MyselfBtn_Tag];
//	if (nil!=tmpBtn1) 
//	{
//        UIImageView * tmpImage = (UIImageView*)[tmpBtn1 viewWithTag:kTabBar_Badge_Image];
//		UILabel * tmpBadgeLable = (UILabel*)[tmpBtn1 viewWithTag:kTabBar_Badge_Label];
//        
//        
//		NSString * tmpS = [NSString stringWithFormat:@"  %@  ",self.badgeString]; //多计算一个字符
//		CGSize needSize = [tmpS sizeWithFont:[UIFont boldSystemFontOfSize:kTabBar_BadgeFont]];//[UIFont systemFontOfSize:kWaitingViewFontSize]];
//		NSInteger curBadgeWidth = 28;
//		NSInteger curBadgeHeight = 18;
//        
//        
//        tmpImage.image = [UIImage imageNamed:@"new.png"];
////		if (kBadgeWidth3 < needSize.width)
////		{
////			curBadgeWidth = kBadgeWidth4;
////            tmpImage.image = [UIImage imageNamed:@"lc4.png"];
////		}
////		else if (kBadgeWidth2 <  needSize.width) 
////		{
////			curBadgeWidth = kBadgeWidth3;
////            tmpImage.image = [UIImage imageNamed:@"lc3.png"];
////		}
////		else if (kBadgeWidth1 <  needSize.width)
////		{
////			curBadgeWidth = kBadgeWidth2;
////            tmpImage.image = [UIImage imageNamed:@"lc2.png"];
////		}else 
////		{
////			curBadgeWidth = kBadgeWidth1;
////            tmpImage.image = [UIImage imageNamed:@"lc1.png"];
////		}
//
//
//			
//		
//		//增加徽章视图，显示动态效果
//		[self.badgeView setFrame :CGRectMake(tmpBtn1.frame.size.width-curBadgeWidth-10, 5, curBadgeWidth, curBadgeHeight)];		
//		[tmpImage setFrame: CGRectMake(0, 0, curBadgeWidth, curBadgeHeight)];	
//		[tmpBadgeLable setFrame: CGRectMake(0, 0, curBadgeWidth, curBadgeHeight-3)];
//		
//		tmpBadgeLable.text = self.badgeString;
//
//	}
//}

#pragma mark 标签点击相关

//展示标签页及其子类
- (void)showTabbarStack : (id)sender
{
	AppDelegate * llqDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
	[llqDelegate.quanTabBar buttonPressedByIndex:1];
}

//
////展示标签页及其子类
//- (void)showTaskTabbarStack : (id)sender
//{
//	AppDelegate * llqDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    
//	//1.把本标签加入到父视图window中
//	//[llqDelegate.window addSubview:self];
//    
//    //3.全局代理增加
//    llqDelegate.forgroundTabBarType = self.curTabBarType;
//    
//    
//	
//	//2.确定选择哪个tabbar
//	switch (self.curTabBarType) {
//		case CustomTabBarType_Quan:
//		{
//			//默认选择第二个圈
//			[llqDelegate.quanTabBar myFavoriteBtnPressed:llqDelegate.quanTabBar];
//            
//            UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.curSelectIdx];
//           NSArray * controllerArr = selectNavi.childViewControllers;
//            for (UIViewController *controller in controllerArr) {
//                if ([controller isKindOfClass:[SettingTaskListViewController class]]) {
//                    SettingTaskListViewController *settingviewcontroller = (SettingTaskListViewController*)controller;
//                    [settingviewcontroller setTabBar];
//                }
//            }
//
//		}
//			break;
//		default:
//			break;
//	}
//	
//}


//关标签页及其子类
- (void)hideTabbarStack : (id)sender
{
	//1.把本标签从，父窗口window中移除
	[self removeFromSuperview];
	
	//2.将navigationController里的所有子视图推出，并将本navigation的唯一视图从window中移除

    AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
    for( UINavigationController * oneNaviController in llqDelegate.quanNaviTabBarArray )
    {
        [oneNaviController popToRootViewControllerAnimated:NO];
        //Quan的Tabbar不需要进行彻底的视图移除操作，可以隐藏根视图
        //[oneNaviController.topViewController.view removeFromSuperview];
        
        //但是重新展示的时候应该重新加载所有相关项
    }

}

//注销时，清除这个标签的所有内容
- (void) cleanTabbar : (id)sender
{
	//1.把本标签从，父窗口window中移除
	[self removeFromSuperview];
	
	//2.将navigationController里的所有子视图推出，并将本navigation的唯一视图从window中移除

    AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
    for( UINavigationController * oneNaviController in llqDelegate.quanNaviTabBarArray )
    {
        [oneNaviController popToRootViewControllerAnimated:NO];
        //因为现在是注销，所以要彻底删除视图
        [oneNaviController.topViewController.view removeFromSuperview];
        [oneNaviController.view removeFromSuperview];
    }
    //全部清除之后就可以，彻底干掉了
    llqDelegate.quanNaviTabBarArray = nil;

	
}

//点击按钮
- (void) buttonPressed:(id)sender;
{
    UIButton * button = (UIButton*) sender;
    int tag = button.tag;
  
    [self buttonPressedByIndex:tag-3000];
}
- (void) buttonPressedByIndex:(int)index;
{
    
    if (self.preSelectIdx == index) {
        return;
    }
	
	if (NO==[self canSwith:self]) {
		//tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
        //则，取消以前的所有操作
        //return;
	}
	
	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
	//1.剔除以前的navi
	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
	[preSelectNavi.view removeFromSuperview];
	
	
	//3.取消前一个选中，增加当前的选中
	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
	tmpBtnPre.selected = NO;
    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
     tmpLabelPre.textColor = [UIColor whiteColor];
     tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
     tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
	
	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_QuanBtn_Tag];
	tmpBtn.selected = YES;
    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_QuanLbl_Tag];
    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];
	
	
	//2.显示当前Navi
	NSInteger curSel = index;
    if (curSel==self.preSelectIdx)
    {
        //        [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_PhoneSearch] updateSign:YES];
    }
    
	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
    
    [llqDelegate.window addSubview:selectNavi.view];
	self.preSelectIdx = curSel;
	self.curSelectIdx = curSel;
    
    
    //    //滑块动画
    //	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
    //	[self bringSubviewToFront:self.glowView];
    //	[UIView beginAnimations:@"flow" context:nil];
    //	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
    //	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
    //	[UIView commitAnimations];


}

//
////爱号一搜按钮点击事件
//- (void) searchBtnPressed : (id)sender
//{
//    
//	if (CustomTabBarType_Quan != self.curTabBarType) {
//		return;
//	}
//    
//    if (self.preSelectIdx == 2) {
//        return;
//    }
//	
//	if (NO==[self canSwith:self]) {
//		//tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
//        //则，取消以前的所有操作
//        //return;
//	}
//	
//	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
//	//1.剔除以前的navi
//	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
//	[preSelectNavi.view removeFromSuperview];
//	
//	
//	//3.取消前一个选中，增加当前的选中
//	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
//	tmpBtnPre.selected = NO;
//    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
//    tmpLabelPre.textColor = [UIColor whiteColor];
//    tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
//    tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
//	
//	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_QuanBtn_Tag];
//	tmpBtn.selected = YES;
//    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_QuanLbl_Tag];
//    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
//    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];
//	
//	
//	//2.显示当前Navi
//	NSInteger curSel = 2;
//    if (curSel==self.preSelectIdx)
//    {
////        [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_PhoneSearch] updateSign:YES];
//    }
//    
//	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
//    
//    [llqDelegate.window addSubview:selectNavi.view];
//	self.preSelectIdx = curSel;
//	self.curSelectIdx = curSel;
//    
//    [UserBehavior collectDataWithBegin:1];
//    
//     [MobClick event:@"1"];
//    
////    //滑块动画
////	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
////	[self bringSubviewToFront:self.glowView];
////	[UIView beginAnimations:@"flow" context:nil];
////	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
////	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
////	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
////	[UIView commitAnimations];
//} 
//
//
////附近商户按钮点击事件
//- (void) nearShopBtnPressed : (id)sender
//{
//    if ([CommonResource sharedCommonResource].isVoice) {
//        return;
//    }
//    if (self.preSelectIdx == 0) {
//        return;
//    }
//    //18.	附近商户底栏的点击数
//    [UserBehavior collectDataWithBegin:18];
//    [MobClick event:@"18"];
//	if (CustomTabBarType_Quan != self.curTabBarType) {
//		return;
//	}
//
//	if (NO==[self canSwith:self]) {
//		//tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
//        //则，取消以前的所有操作
//        //return;
//        printLog(@"//动态按钮点击事件l;fks;fl=====%d\n");
//	}
//
//	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
//	
//	//1.
//	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
//	
//	//2.剔除以前的navi
//	[preSelectNavi.view removeFromSuperview];
//	
//	//3.取消前一个选中，增加当前的选中
//	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
//	tmpBtnPre.selected = NO;
//    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
//    tmpLabelPre.textColor = [UIColor whiteColor];
//    tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
//    tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
//	
//	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_DynamicBtn_Tag];
//	tmpBtn.selected = YES;
//    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_DynamicLbl_Tag];
//    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
//    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];    
//	
//	//2.显示当前Navi
//	NSInteger curSel = 0;
//    
//    if (curSel==self.preSelectIdx)
//    {
//
////    [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_GroupList] updateSign:YES];
//
//    }
//    
//	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
//	//[self.window insertSubview:selectNavi.view belowSubview:llqDelegate.quanTabBar];
//    [llqDelegate.window addSubview:selectNavi.view];
//    self.preSelectIdx = curSel;
//	self.curSelectIdx = curSel;
//    
//    
//    NSArray * controllerArr = selectNavi.childViewControllers;
//    for (UIViewController *controller in controllerArr) {
//        if ([controller isKindOfClass:[NearShopViewController class]]) {
//            NearShopViewController *settingviewcontroller = (NearShopViewController*)controller;
//            [settingviewcontroller.shopListTable reloadData];
//        }
//    }
//    
////    //滑块动画
////	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
////	[self bringSubviewToFront:self.glowView];
////	[UIView beginAnimations:@"flow" context:nil];
////	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
////	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
////	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
////	[UIView commitAnimations];
//}
//
//
////常用号码按钮点击事件
//- (void) commonBtnPressed : (id)sender
//{
//    if ([CommonResource sharedCommonResource].isVoice) {
//        return;
//    }
//    if (self.preSelectIdx == 1) {
//        return;
//    }
//    
//    //25.	常用号码底栏点击数
//    [UserBehavior collectDataWithBegin:25];
//    [MobClick event:@"25"];
//	if (CustomTabBarType_Quan != self.curTabBarType) {
//		return;
//	}
//	
//	if (NO==[self canSwith:self]) {
//		//tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
//        //则，取消以前的所有操作
//        //return;
//	}
//    //helei 2012-2-1 
//    //2.显示当前Navi
//	NSInteger curSel = 1;
//    
////    if (curSel==self.preSelectIdx)
////    {
////        SmartDialingController * dynaViewController =  [UIUtility findRequiredViewController:SearchViewType_ClassViewController 
////                                                                         viewControllerClass:[SmartDialingController class]];
////        if (nil!=dynaViewController) 
////        {
////            //[dynaViewController showNumKeyBorad];
////            [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_SmartDailing] updateSign:YES];
////            return;
////        }
////    }
//    //helei end
//	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
//	//1.剔除以前的navi
//	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
//	[preSelectNavi.view removeFromSuperview];
//	
//	//3.取消前一个选中，增加当前的选中
//	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
//	tmpBtnPre.selected = NO;
//    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
//    tmpLabelPre.textColor = [UIColor whiteColor];
//    tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
//    tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
//	
//	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_FindBtn_Tag];
//	tmpBtn.selected = YES;
//    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_FindLbl_Tag];
//    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
//    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];
//	
//	//2.显示当前Navi
//	//NSInteger curSel = 2;
//	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
//    [llqDelegate.window addSubview:selectNavi.view];
//    self.preSelectIdx = curSel;
//	self.curSelectIdx = curSel;
//    
//    
//    if (curSel==self.preSelectIdx)
//    {
////        SmartDialingController * dynaViewController =  [UIUtility findRequiredViewController:SearchViewType_ClassViewController 
////                                                                         viewControllerClass:[SmartDialingController class]];
////        if (nil!=dynaViewController) 
////        {
////            //[dynaViewController showNumKeyBorad];
////            [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_SmartDailing] updateSign:YES];
////            return;
////        }
//    }
//    
////    //滑块动画
////	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
////	[self bringSubviewToFront:self.glowView];
////	[UIView beginAnimations:@"flow" context:nil];
////	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
////	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
////	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
////	[UIView commitAnimations];
//}
//
//
////我 按钮点击事件
//- (void) mySelfBtnPressed : (id)sender
//{
//    if ([CommonResource sharedCommonResource].isVoice) {
//        return;
//    }
//    if (self.preSelectIdx == 3) {
//        return;
//    }
//    //收藏点击次数
////    [UserBehavior collectDataWithBegin:67];    
//    
//	if (CustomTabBarType_Quan != self.curTabBarType) {
//		return;
//	}
//	
//	if (NO==[self canSwith:self]) {
//        //tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
//        //则，取消以前的所有操作
//        //return;
//	}
//    
//	
//	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
//	//1.剔除以前的navi
//	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
//	[preSelectNavi.view removeFromSuperview];
//	
//	
//	//3.取消前一个选中，增加当前的选中
//	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
//	tmpBtnPre.selected = NO;
//    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
//    tmpLabelPre.textColor = [UIColor whiteColor];
//    tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
//    tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
//	
//	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_MyselfBtn_Tag];
//	tmpBtn.selected = YES;
//    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_MyselfLbl_Tag];
//    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
//    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];
//    
//	
//	//2.显示当前Navi
//	NSInteger curSel = 3;    
//    if (curSel==self.preSelectIdx)
//    {
////        [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_EvenMore] updateSign:YES];
//    }
//	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
//	//[self.window insertSubview:selectNavi.view belowSubview:llqDelegate.quanTabBar];
//    [llqDelegate.window addSubview:selectNavi.view];
//    self.preSelectIdx = curSel;
//	self.curSelectIdx = curSel;
//    
////    //滑块动画
////	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
////	[self bringSubviewToFront:self.glowView];
////	[UIView beginAnimations:@"flow" context:nil];
////	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
////	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
////	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
////	[UIView commitAnimations];
//    
//}
//
////收藏 按钮点击事件
//- (void) myFavoriteBtnPressed : (id)sender
//{
//    if ([CommonResource sharedCommonResource].isVoice) {
//        return;
//    }
//    if (self.preSelectIdx == 3) {
//        return;
//    }
//    
//    //43.	我的收藏底栏点击数
//    [UserBehavior collectDataWithBegin:43];
//    [MobClick event:@"43"];
//    
//    [UserBehavior collectDataWithBegin:105];
//    [MobClick event:@"105"];
//    
//	if (CustomTabBarType_Quan != self.curTabBarType) {
//		return;
//	}
//	
//	if (NO==[self canSwith:self]) {
//        //tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
//        //则，取消以前的所有操作
//        //return;
//	}
//    
//	
//	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
//	//1.剔除以前的navi
//	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
//	[preSelectNavi.view removeFromSuperview];
//	
//	
//	//3.取消前一个选中，增加当前的选中
//	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
//	tmpBtnPre.selected = NO;
//    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
//     tmpLabelPre.textColor = [UIColor whiteColor];
//     tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
//     tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
//	
//	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_Favoritetn_Tag];
//	tmpBtn.selected = YES;
//    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_FavoriteLbl_Tag];
//    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
//    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];
//    
//	
//	//2.显示当前Navi
//	NSInteger curSel = 3;    
//    if (curSel==self.preSelectIdx)
//    {
//        //        [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_EvenMore] updateSign:YES];
//    }
//	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
//	//[self.window insertSubview:selectNavi.view belowSubview:llqDelegate.quanTabBar];
//    [llqDelegate.window addSubview:selectNavi.view];
//    self.preSelectIdx = curSel;
//	self.curSelectIdx = curSel;
//    
//    //    //滑块动画
//    //	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
//    //	[self bringSubviewToFront:self.glowView];
//    //	[UIView beginAnimations:@"flow" context:nil];
//    //	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    //	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
//    //	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
//    //	[UIView commitAnimations];
//    
//    NSArray * controllerArr = selectNavi.childViewControllers;
//    for (UIViewController *controller in controllerArr) {
//        if ([controller isKindOfClass:[SettingTaskListViewController class]]) {
//            SettingTaskListViewController *settingviewcontroller = (SettingTaskListViewController*)controller;
//            [settingviewcontroller reloadTaskList];
//        }
//    }
//}
//
//
////设置 按钮点击事件
//- (void) myEventMoreBtnPressed : (id)sender
//{
//    if ([CommonResource sharedCommonResource].isVoice) {
//        return;
//    }
//    if (self.preSelectIdx == 4) {
//        return;
//    }
//    //43.	我的收藏底栏点击数
////    [UserBehavior collectDataWithBegin:43];
//    
//	if (CustomTabBarType_Quan != self.curTabBarType) {
//		return;
//	}
//	
//	if (NO==[self canSwith:self]) {
//        //tank:2011.9.20现在放开，即使有网络操作也要允许切换页签，切换后如果有联网操作
//        //则，取消以前的所有操作
//        //return;
//	}
////    [UserBehavior collectDataWithBegin:106];
////    [MobClick event:@"106"];
//	
//	AppDelegate * llqDelegate = [UIApplication sharedApplication].delegate;
//	//1.剔除以前的navi
//	UINavigationController * preSelectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:self.preSelectIdx];
//	[preSelectNavi.view removeFromSuperview];
//	
//	
//	//3.取消前一个选中，增加当前的选中
//	UIButton * tmpBtnPre = (UIButton*)[llqDelegate.quanTabBar viewWithTag:self.preSelectIdx+kTabbar_DynamicBtn_Tag];
//	tmpBtnPre.selected = NO;
//    /*UILabel *tmpLabelPre = (UILabel*)[tmpBtnPre viewWithTag:preSelectIdx+kTabbar_QuanLbl_Tag];
//     tmpLabelPre.textColor = [UIColor whiteColor];
//     tmpLabelPre.shadowColor = [UIColor colorWithRed:0.0/255.0 green:0x4e/255.0 blue:0x71/255.0 alpha:1.0];
//     tmpLabelPre.shadowOffset = CGSizeMake(0, 1);*/
//	
//	UIButton * tmpBtn = (UIButton*)[llqDelegate.quanTabBar viewWithTag:kTabbar_MyselfBtn_Tag];
//	tmpBtn.selected = YES;
//    UILabel *tmpLabel = (UILabel*)[tmpBtn viewWithTag:kTabbar_MyselfLbl_Tag];
//    tmpLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0x40/255.0 blue:0x68/255.0 alpha:1.0];
//    tmpLabel.shadowColor = [UIColor colorWithRed:0x2a/255.0 green:0xab/255.0 blue:0xe3/255.0 alpha:1.0];
//    
//	
//	//2.显示当前Navi
//	NSInteger curSel = 4;
//    if (curSel==self.preSelectIdx)
//    {
//        //        [[CommonResource sharedCommonResource] setPage:[UIViewControllerCustomize getPageID:UIPageID_EvenMore] updateSign:YES];
//    }
//	UINavigationController * selectNavi = [llqDelegate.quanNaviTabBarArray objectAtIndex:curSel];
//	[selectNavi.navigationBar setImage:@"headbg.png"];
//	//[self.window insertSubview:selectNavi.view belowSubview:llqDelegate.quanTabBar];
//    [llqDelegate.window addSubview:selectNavi.view];
//    self.preSelectIdx = curSel;
//	self.curSelectIdx = curSel;
//    
//    //    //滑块动画
//    //	int x = GLOW_LEFT_GAP + self.curSelectIdx*kTabbarImageWidth_4;
//    //	[self bringSubviewToFront:self.glowView];
//    //	[UIView beginAnimations:@"flow" context:nil];
//    //	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    //	[UIView setAnimationDuration:GLOW_ANIMATION_TIME];
//    //	[self.glowView setFrame:CGRectMake(x, kUITabBarHeight-GLOW_IMAGE_HEIGHT, GLOW_IMAGE_WIDTH, GLOW_IMAGE_HEIGHT)];
//    //	[UIView commitAnimations];
//    
//}

#pragma mark --
#pragma mark 初始化
- (id)init
{
    self.backgroundColor = [UIColor clearColor];
	//CGRect viewframe = [[UIScreen mainScreen] applicationFrame];
	if (self = [super initWithFrame:CGRectMake(0, 480-kTabbarImageHeight_3, 320, kTabbarImageHeight_3)]) {
	
		UIImageView * tmpImView = [[UIImageView alloc] initWithFrame:
								   CGRectMake(0, 0, 320, 55)];
		tmpImView.image = [UIImage imageNamed:@"dilan.png"];
		[self addSubview:tmpImView];


		UIView * tmpTabBarView = [[UIView alloc] initWithFrame:
								  CGRectMake(0, 0, 320, kTabbarImageHeight_3)];
		tmpTabBarView.backgroundColor = [UIColor clearColor];

        UIButton * tmpBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        tmpBtn2.frame = CGRectMake(kTabbarImageWidth_4*2, 0, kTabbarImageWidth_4, kTabbarImageHeight_4);
        [tmpBtn2 setImage:nil forState:UIControlStateNormal];
        [tmpBtn2 setImage:[UIImage imageNamed:@"sousuo_h.png"] forState:UIControlStateHighlighted];
        [tmpBtn2 setImage:[UIImage imageNamed:@"sousuo_h.png"] forState:UIControlStateSelected];
        [tmpBtn2 addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchDown];
        tmpBtn2.tag = kTabbar_QuanBtn_Tag;
        [tmpTabBarView addSubview:tmpBtn2];

        
        UIButton * tmpBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        tmpBtn1.frame = CGRectMake(0, 0, kTabbarImageWidth_4, kTabbarImageHeight_4);
        [tmpBtn1 setImage:nil forState:UIControlStateNormal];
        [tmpBtn1 setImage:[UIImage imageNamed:@"fujin_h.png"] forState:UIControlStateHighlighted];
        [tmpBtn1 setImage:[UIImage imageNamed:@"fujin_h.png"] forState:UIControlStateSelected];
        [tmpBtn1 addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchDown];
        tmpBtn1.tag = kTabbar_DynamicBtn_Tag;
        [tmpTabBarView addSubview:tmpBtn1];
        
        
        UIButton * tmpBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        tmpBtn3.frame = CGRectMake(kTabbarImageWidth_4, 0, kTabbarImageWidth_4, kTabbarImageHeight_4);
        [tmpBtn3 setImage:nil forState:UIControlStateNormal];
        [tmpBtn3 setImage:[UIImage imageNamed:@"changyong_h.png"] forState:UIControlStateHighlighted];
        [tmpBtn3 setImage:[UIImage imageNamed:@"changyong_h.png"] forState:UIControlStateSelected];
        [tmpBtn3 addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchDown];
        tmpBtn3.tag = kTabbar_FindBtn_Tag;
        [tmpTabBarView addSubview:tmpBtn3];
        
        UIButton * tmpBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        tmpBtn4.frame = CGRectMake(kTabbarImageWidth_4*3, 0, kTabbarImageWidth_4, kTabbarImageHeight_4);
        [tmpBtn4 setImage:nil forState:UIControlStateNormal];
        [tmpBtn4 setImage:[UIImage imageNamed:@"shoucang_h.png"] forState:UIControlStateHighlighted];
        [tmpBtn4 setImage:[UIImage imageNamed:@"shoucang_h.png"] forState:UIControlStateSelected];
        [tmpBtn4 addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchDown];
        tmpBtn4.tag = kTabbar_Favoritetn_Tag;
        [tmpTabBarView addSubview:tmpBtn4];  
        
        
//        UIButton * tmpBtn5 = [UIButton buttonWithType:UIButtonTypeCustom];
//        tmpBtn5.frame = CGRectMake(kTabbarImageWidth_4*4, 0, kTabbarImageWidth_4, kTabbarImageHeight_4);
//        [tmpBtn5 setImage:nil forState:UIControlStateNormal];
//        [tmpBtn5 setImage:[UIImage imageNamed:@"geren_h.png"] forState:UIControlStateHighlighted];
//        [tmpBtn5 setImage:[UIImage imageNamed:@"geren_h.png"] forState:UIControlStateSelected];
//        [tmpBtn5 addTarget:self
//                    action:@selector(buttonPressed:)
//          forControlEvents:UIControlEventTouchDown];
//        tmpBtn5.tag = kTabbar_MyselfBtn_Tag;
//        [tmpTabBarView addSubview:tmpBtn5];
        
        
        
//        //增加徽章视图，显示动态效果
//        UIView * tmpBadge = [[UIView alloc] initWithFrame:
//                             CGRectMake(tmpBtn5.frame.size.width-kBadgeWidth2, 3, kBadgeWidth2, kBadgeHeight2)];
//        self.badgeView = tmpBadge;
//        tmpBadge.hidden = YES;
//        [tmpBtn5 addSubview:self.badgeView];
//
//
//        UIImageView * tmpImage = [[UIImageView alloc] initWithFrame:
//                                  CGRectMake(0, 0, kBadgeWidth2, kBadgeHeight2)];
//        [tmpBadge addSubview:tmpImage];
//        tmpImage.tag = kTabBar_Badge_Image;
//        tmpImage.image = [UIImage imageNamed:@"lc2.png"];
//        UILabel * tmpBadgeLable = [[UILabel alloc] initWithFrame: self.badgeView.frame];
//        tmpBadgeLable.tag = kTabBar_Badge_Label;
//        tmpBadgeLable.backgroundColor = [UIColor clearColor];
//        tmpBadgeLable.textAlignment = UITextAlignmentCenter;
//        tmpBadgeLable.textColor = [UIColor whiteColor];
//        tmpBadgeLable.font = [UIFont boldSystemFontOfSize:kTabBar_Title];
//        tmpBadgeLable.text = NSLocalizedString(@"New",nil);
//        [self.badgeView addSubview:tmpBadgeLable];
        
        

		self._tabBarView = tmpTabBarView;
		[self addSubview:tmpTabBarView];

	}

	return self;
}

@end
