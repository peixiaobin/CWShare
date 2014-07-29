//
//  CWShare.h
//  CWShareDemo
//
//  Created by Wang Jun on 12-8-18.
//
//

#import <Foundation/Foundation.h>
#import "CWShareSina.h"
#import "CWShareTencent.h"
#import "CWShareDelegate.h"
#import "CWShareWeChat.h"
#import "CWShareConfig.h"

@interface CWShare : NSObject <CWShareSinaDelegate,CWShareTencentDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) CWShareSina *sinaShare;
@property (nonatomic, strong) CWShareTencent *tencentShare;
@property (weak) id<CWShareDelegate> delegate;
@property (weak) UIViewController *parentViewController;
@property (nonatomic, strong) CWShareWeChat *wechatShare;

//获取共享对象
+ (id)shareObject;

- (void)showShareMenu;

//开始新浪微博授权登录
- (void)startSinaAuthorizeLogin;
//分享内容到新浪微博
- (void)sinaShareWithContent:(NSString *)theContent;
//分享内容和图片到新浪微博
- (void)sinaShareWithContent:(NSString *)theContent withImage:(UIImage *)theImage;

//开始腾讯QQ授权登录
- (void)startTencentAuthorizeLogin;
//分享内容到腾讯微博
- (void)tencentShareToWeiBoWithContent:(NSString *)theContent;
//分享内容和图片到腾讯微博
- (void)tencentShareToWeiBoWithContent:(NSString *)theContent withImage:(UIImage *)theImage;
//分享内容到QQ空间(QQ空间的分享属于网页资源，所以需要传的参数比较多)
- (void)tencentShareToQQZoneWithDescription:(NSString *)theDesc withTitle:(NSString *)theTitle Content:(NSString *)theContent contentUrl:(NSString *)contentUrl withSynchronizeWeibo:(BOOL)theBool;

//清空新浪微博授权登录信息
- (void)clearSinaAuthorizeInfo;

//清空腾讯QQ授权登录信息
- (void)clearTencentAuthorizeInfo;

//分享文字到微信好友
- (void)wechatSessionShareWithTitle:(NSString *)theTitle;
//分享新闻到微信好友
- (void)wechatSessionShareWithTitle:(NSString *)theTitle withContent:(NSString *)theContent withImage:(UIImage *)theImage withWebUrl:(NSString *)theUrl;
//分享文字到微信朋友圈
- (void)wechatTimelineShareWithTitle:(NSString *)theTitle;
//分享新闻到微信朋友圈
- (void)wechatTimelineShareWithTitle:(NSString *)theTitle withContent:(NSString *)theContent withImage:(UIImage *)theImage withWebUrl:(NSString *)theUrl;

//UIApplication Delegate
- (BOOL)shareHandleOpenURL:(NSURL *)url;

@end
