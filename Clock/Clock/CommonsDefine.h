//
//  Enum.h
//  DigitAlbum
//
//  Created by  on 11-9-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CURRENT_VERSION @"V2.9.4"
#define kTabBarHeight 50.0f
#define kUINavigationBarHeight 44
#define kUIStatuBarHeight 20
#define KCenterViewHeight ( int )([ [ UIScreen mainScreen ] bounds ].size.height-kTabBarHeight-44-20)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


#ifndef TransformRadian
#define TransformRadian(angle) (angle) *M_PI/180.0f
#endif

typedef enum
{
	Iphone_1G,
	Iphone_2G,
	Iphone_3GS,
	Iphone_Touch_1G,
	Iphone_Touch_2G,
	Iphone_Touch_3G,
	Iphone_4,
    Iphone_4S,
	Iphone_Touch_4G,
    iPod_Touch_1G,
    iPod_Touch_2G,
    iPod_Touch_4G,
    iPad_1G,
    iPad_2G,
    Iphone_Above4   //tank:2011.12.6 所有已经超过了4的新手机，我们现在使用这个标志,
}PlatFormType;

//现有主流嵌入式苹果机类型
typedef enum
{
	System_ios_3_x,
	System_ios_4_x,
    System_ios_5_x,
    System_ios_6_x
}SystemType;

typedef enum
{
	DeviceModel_Iphone,
	DeviceModel_IpodTouch
}DeviceModelType;

//typedef enum
//{
//    DARequestType_User_Login=0,//用户登陆
//    DARequestType_User_Regist,//用户注册
//    DARequestType_User_GetVerifyCode,//获取验证码
//    DARequestType_User_GetPass,//获取密码
//    DARequestType_User_ResetPass,//重置密码
//    DARequestType_DownShopImage,
//    DARequestType_DownSaleImage,
//    DARequestType_Address_Back,//备份
//    DARequestType_Address_Recover,//恢复
//    DARequestType_SalesDetail, //查询优惠详情
//    DARequestType_Number_Seach,//号码检索
//    DARequestType_Number_Group,//精品号库分组
//    DARequestType_Number_GroupDetail,//精品号库详情
//    DARequestType_Merchant_YiSou,//商户搜索一搜
//    DARequestType_Merchant_Merchant,//附近商户
//    DARequestType_Merchant_TYPE,//附近商户分类
//    DARequestType_Merchant_MerchantSale,//附近商户优惠
//    DARequestType_Merchant_GetCity,//获取城市
//    DARequestType_FeedBack,  //问题反馈
//    DARequestType_update, //更新请求
//    DARequestType_SendUserBehavior, //发送用户行为统计
//    DARequestType_SendInstall, //发送安装请求
//    DARequestType_LoginRequest, //用户登陆统计
//    DARequestType_RecommendApp, //推荐的应用
//    DARequestType_HotTags, //热门搜索
//    DARequestType_DeviceToken, //devicetoken
//    DARequestType_GetPicpath,//根据号码获取商户图片地址
//    DARequestType_GetStartInfo, //在软件启动时获取相关信息
//    
//    DARequestType_SaveTask,//上传任务
//    DARequestType_DeleteTask,//删除任务
//    DARequestType_LoadAllTask, //加载所有任务
//    DARequestType_UpdateTask,//更新任务
//    DARequestType_BindTasksToPhone,//绑定任务到手机号
//    DARequestType_UploadMerchantInfo,//纠错
//    
//    
//    DARequestType_GetMerchantYouhuiInfo,//获取商户优惠信息
//    DARequestType_GetYouHuiMerchantDetail,//获取优惠详情
//    
//    DARequestType_GetUserJifen //获取用户积分
//
//    
//
//}DARequestTypeEnum;//请求类型
//
//
//typedef enum
//{
//    DARequestState_Ready,//准备
//    DARequestState_Start,//开始
//    DARequestState_Finish,//完成
//    DARequestState_Fail,//失败
//    DARequestState_Cancel//取消
//}DARequestStateEnum;//请求状态枚举
//
//
//typedef enum
//{
//    DAReturnDataType_String,//字符串
//    DAReturnDataType_Data//数据
//}DAReturnDataTypeEnum;//返回的数据类型
//
//typedef enum
//{
//    DANetworkType_HttpRequest,
//    DANetworkType_FormDataRequest
//}DANetworkTypeEnum;//网络提交类型
//
////要进行搜索的当前结果窗口
//typedef enum
//{
//	SearchViewType_TopViewController = 0,
//	SearchViewType_ClassViewController = 1
//}SearchViewType;
//
//typedef enum 
//{
//    BusinessErrorCode_None                                      = 0,
//    BusinessErrorCode_ASIConnectionFailureErrorType             = 1,
//    BusinessErrorCode_ASIRequestTimedOutErrorType               = 2,
//    BusinessErrorCode_ASIAuthenticationErrorType                = 3,
//    BusinessErrorCode_ASIRequestCancelledErrorType              = 4,
//    BusinessErrorCode_ASIUnableToCreateRequestErrorType         = 5,
//    BusinessErrorCode_ASIInternalErrorWhileBuildingRequestType  = 6,
//    BusinessErrorCode_ASIInternalErrorWhileApplyingCredentialsType  = 7,
//	BusinessErrorCode_ASIFileManagementError                    = 8,
//	BusinessErrorCode_ASITooMuchRedirectionErrorType            = 9,
//	BusinessErrorCode_ASIUnhandledExceptionError                = 10,
//	BusinessErrorCode_ASICompressionError                       = 11,
//    
//    BusinessErrorCode_LLQ_ServerError00                       = 21,
//    BusinessErrorCode_LLQ_ServerError05                       = 22,    //
//    BusinessErrorCode_LLQ_ServerError25                       = 25,    //文字提示
//    BusinessErrorCode_LLQ_ServerError26                       = 26    //文字提示（需要跳转）
//}BusinessErrorCode;
//
////t: 0＝来自查询 1＝来自收藏
//typedef enum{
//    FromType_search = 0,
//    FromType_favorite =1,
//    FromType_cloud = 2
//}FromType;
////t: 0=商户收藏 1＝优惠卷收藏
//typedef enum{
//    FavoriteType_merchant=0,
//    FavoriteType_sale=1,
//    FavoriteType_Yisou=2,
//}FavoriteType;
//
////t：0=默认，1=增加  2=修改 3=删除
//typedef enum
//{
//    OperationType_default = 0,
//    OperationType_add = 1,
//    OperationType_edit = 2,
//    OperationType_del = 3
//}OperationType;
//
////好联络的反馈类型
//typedef enum
//{
//	FeedBack_None = -1,       //无反馈类型，不予响应
//	FeedBack_Suggestion = 0, //建议
//	FeedBack_Bug = 1,		 //问题
//	FeedBack_Complaints = 2, //投诉
//}FeedBackType;
//
//
//typedef enum {
//	UIPullRefreshType_NoneRefresh = 0, //无刷新状态
//	UIPullRefreshType_PullDown, //下拉刷新
//	UIPullRefreshType_PullUp, //上提翻页
//}UIPullRefreshType;
//
//#define JPEG_COMPRESSIONQUALITY  0.60    //图片压缩质量
//
//
//typedef enum
//{
//	CustomTabBarType_Quan = 0,
//	CustomTabBarType_HomeQuan
//}CustomTabBarType;

