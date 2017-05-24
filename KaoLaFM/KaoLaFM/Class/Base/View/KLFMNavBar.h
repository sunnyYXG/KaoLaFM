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
- (void)touchLeftButton;
- (void)touchRightButton;
- (void)touchRightOtherButton;
@end

@interface KLFMNavBar : UIView


@property (weak, nonatomic)  UIButton *iLeftButton;
@property (weak, nonatomic)  UIButton *iRightButton;
@property (weak, nonatomic)  UILabel *iTitleLabel;
@property (weak, nonatomic)  UIButton *iRightOtherButton;

@property (nonatomic) id<KLFMNavBarDelegate>delegate;

- (void)configureViewWithTitle:(NSString *)title Type:(KLFMNavBarType)type;

@end
