//
//  HomeTJMenuView.h
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeTJMenuViewDelegate <NSObject>

- (void)pushWebViewWithURL:(NSString *)url;

@end

@interface HomeTJMenuView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic)id<HomeTJMenuViewDelegate>delegate;

@property (nonatomic)NSArray *menus;
@property (nonatomic)NSArray *h5_urls;
@property (nonatomic)UIScrollView *sc;

@end
