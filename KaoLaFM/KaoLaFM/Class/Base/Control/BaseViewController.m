//
//  ViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [UIView setAnimationsEnabled:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissWithCompletion:(void(^)())completion {
    [self dismissViewControllerAnimated:YES completion:completion];
}

- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}

- (void)pushVc:(UIViewController *)vc userInfo:(NSDictionary *)userInfo{
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    BaseViewController *ctr = (BaseViewController *)vc;
    ctr.userInfo = userInfo;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)removeChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc.view removeFromSuperview];
    [childVc willMoveToParentViewController:nil];
    [childVc removeFromParentViewController];
}

- (void)addChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc willMoveToParentViewController:self];
    [self addChildViewController:childVc];
    [self.view addSubview:childVc.view];
    childVc.view.frame = self.view.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)loadData {
    /**
     *  子类实现
     */
    
}

/*
- (void)startProgress {
    self.view.userInteractionEnabled = NO;
    if (self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    [SVProgressHUD show];
}

- (void)stopProgress {
    [SVProgressHUD dismiss];
    self.view.userInteractionEnabled = YES;
    if (self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)showSuccess:(NSString *)msg {
    [SVProgressHUD showSuccessWithStatus:msg];
    self.view.userInteractionEnabled = YES;
    if (self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)showError:(NSString *)msg {
    [SVProgressHUD showErrorWithStatus:msg];
    self.view.userInteractionEnabled = YES;
    if (self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
*/
-(void)showLoadingAnimation{

}
-(void)hideLoadingAnimation{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
