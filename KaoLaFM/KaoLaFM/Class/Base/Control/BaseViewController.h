//
//  ViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLFMNavBar.h"
#import "YXGAVPlayerView.h"

@class BaseRequest,KLFMNavigateView;

@interface BaseViewController : UIViewController<KLFMNavBarDelegate>

@property (nonatomic) BaseRequest *request;

@property (nonatomic) YXGAVPlayerView *playerView;
@property (nonatomic,strong) KLFMNavBar *navBar;


- (void)pop;

- (void)popToRootVc;

- (void)popToVc:(UIViewController *)vc;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)presentVc:(UIViewController *)vc;

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion;

- (void)pushVc:(UIViewController *)vc userInfo:(NSDictionary *)userInfo;

- (void)removeChildVc:(UIViewController *)childVc;

- (void)addChildVc:(UIViewController *)childVc;

- (void)startProgress;

- (void)stopProgress;

- (void)showSuccess:(NSString *)msg;

- (void)showError:(NSString *)msg;

/**
 *  储存上个界面传递过来的数据
 */
@property (nonatomic) NSDictionary *userInfo;

/** 加载中*/
- (void)showLoadingAnimation;

/** 停止加载*/
- (void)hideLoadingAnimation;

/** 创建请求，交给子类实现 */
- (void)initRequest;
/** 请求数据，交给子类去实现*/
- (void)loadData;

@end

