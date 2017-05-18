//
//  HomeNavTabBar.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCNavTabBarDelegate <NSObject>

@optional

- (void)itemDidSelectedWithIndex:(NSInteger)index;
- (void)itemDidSelectedWithIndex:(NSInteger)index withCurrentIndex:(NSInteger)currentIndex;

@end

@interface HomeNavTabBar : UIView

@property (nonatomic, weak)    id<SCNavTabBarDelegate>delegate;

@property (nonatomic, assign)   NSInteger   currentItemIndex;

@property (nonatomic, strong)   NSArray     *itemTitles;
@property (nonatomic, strong)   UIColor     *lineColor;

@property (nonatomic , strong)  NSMutableArray  *items;

- (id)initWithFrame:(CGRect)frame;


- (void)updateData:(NSInteger)lastIndex;



@end

