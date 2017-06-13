//
//  KLFMNavBar.h
//  KaoLaFM
//
//  Created by rongyun on 2017/5/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KLFMNavBarType) {
    KLFMNavBarTypeMain,
    KLFMNavBarTypeBack,
    KLFMNavBarTypeHome,
    KLFMNavBarTypeUserCenter
};

@protocol KLFMNavBarDelegate <NSObject>
@optional
- (void)touchHeadImage;
- (void)touchHistoryButton;
- (void)touchUpdateButton;
- (void)touchSearchButton;

@end

@interface KLFMNavBar : UIView<UIGestureRecognizerDelegate>



@property (nonatomic)  UIImageView *iHeadImage;
@property (nonatomic)  UIButton *iUpdateButton;
@property (nonatomic)  UIButton *iSearchButton;
@property (nonatomic)  UIButton *ihistoryButton;

@property (nonatomic) id<KLFMNavBarDelegate>delegate;

- (void)configureViewWithTitle:(NSString *)title Type:(KLFMNavBarType)type;

@end
