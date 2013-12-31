//
//  UICustomizeTabBar.h
//  LianLuoQuan
//
//  Created by tian kai on 11-4-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonsDefine.h"

#define kUITabBarHeight   55
#define kSelectIndex_Quan 1 //从0开始，1是
#define kSelectIndex_HomeQuan 0 //从0开始，1是

#define kTabbarImageWidth_4 80//64//80
#define kTabbarImageHeight_4 kUITabBarHeight

#define kTabbarImageWidth_3 100
#define kTabbarImageHeight_3 kUITabBarHeight




#define kTabbar_DynamicBtn_Tag  3000 + 0
#define kTabbar_FindBtn_Tag  3000 + 1
#define kTabbar_QuanBtn_Tag  3000 + 2
#define kTabbar_Favoritetn_Tag  3000 + 3
#define kTabbar_MyselfBtn_Tag  3000 + 4

#define kTabbar_QuanLbl_Tag  6000 + 0
#define kTabbar_DynamicLbl_Tag  6000 + 1
#define kTabbar_FindLbl_Tag  6000 + 2
#define kTabbar_MyselfLbl_Tag  6000 + 3
#define kTabbar_FavoriteLbl_Tag  6000 + 4


#define kTabbar_MainQuanBtn_Tag  4000 + 0
#define kTabbar_MemberBtn_Tag  4000 + 1
#define kTabbar_OperationBtn_Tag  4000 + 2


#define kTabBar_Badge_Image 5000 + 0
#define kTabBar_Badge_Label 5000 + 1


#define kTabBar_Title 10
#define kTabBar_BadgeFont 12

#define kBadgeWidth1 20
#define kBadgeHeight1 21

#define kBadgeWidth2 28
#define kBadgeHeight2 21

#define kBadgeWidth3 36
#define kBadgeHeight3 21

#define kBadgeWidth4 44
#define kBadgeHeight4 21


@interface UICustomizeTabBar : UIView {
	UIView * _tabBarView;
//	CustomTabBarType curTabBarType;
	NSInteger curSelectIdx;
	NSInteger preSelectIdx;
    UIView * badgeView; //徽章视图，现在只有动态有
    NSString * badgeString; //徽章要显示的字符串
    
    UIImageView *glowView;  //底下的滑动小条
}

@property (nonatomic, strong) UIView * _tabBarView;
//@property CustomTabBarType curTabBarType;
@property NSInteger curSelectIdx;
@property NSInteger preSelectIdx;
@property (nonatomic, strong) UIView * badgeView;
@property (nonatomic, strong) NSString * badgeString;
@property (nonatomic, strong) UIImageView *glowView;  //底下的滑动小条

//- (id)initWithType:(CustomTabBarType)tabBarType;
- (id)init;
//- (void)dealloc;


//显示徽章
- (void) showBadge : (NSString*)badgeString
			hidden : (BOOL)hidden;

//展示标签页及其子类
- (void)showTabbarStack : (id)sender;

//关标签页及其子类
- (void)hideTabbarStack : (id)sender;

//注销时，清除这个标签的所有内容
- (void) cleanTabbar : (id)sender;

- (void) buttonPressedByIndex:(int)index;

////号码管理按钮点击事件
//- (void) phoneManageBtnPressed : (id)sender;
//
////爱号一搜按钮点击事件
//- (void) searchBtnPressed : (id)sender;
//
////智能拨号按钮点击事件
//- (void) smartDialBtnPressed : (id)sender;
//
////我 按钮点击事件
//- (void) mySelfBtnPressed : (id)sender;
//
////收藏 按钮点击事件
//- (void) myFavoriteBtnPressed : (id)sender;


//模态状态检测，只要有一个Tabbar的视图中，是模态状态，则不能进行切换操作
- (BOOL) canSwith : (id)sender;

//
//- (void)showTaskTabbarStack : (id)sender;

@end
