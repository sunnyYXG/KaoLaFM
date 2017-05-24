//
//  HomeTJMenuView.h
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeTJMenuViewDelegate <NSObject>
- (void)HomeTJMenuPushWithURL:(NSString *)url;
@end

typedef void (^HomeTJMenuViewItemsBlock)(NSInteger index);

@interface HomeTJMenuView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic,copy) HomeTJMenuViewItemsBlock itemsBlock;

@property (nonatomic)id<HomeTJMenuViewDelegate>delegate;

@property (nonatomic)NSArray *menus;
@property (nonatomic)NSArray *h5_urls;
@property (nonatomic)UIScrollView *sc;

@end
