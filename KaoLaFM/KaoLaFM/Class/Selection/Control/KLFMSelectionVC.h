//
//  KLFMSelectionVC.h
//  KaoLaFM
//
//  Created by rongyun on 17/5/17.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewController.h"
@class SelectionBaseClass,CycleBannerView,HomeTJMenuView;

@interface KLFMSelectionVC : BaseTableViewController


@property (nonatomic) NSArray *data;
//@property (nonatomic) NSMutableArray *frameArr;

@property (nonatomic) SelectionBaseClass *baseModel;

/**
 *  顶部广告图片轮播 图片地址
 */
@property (nonatomic)NSArray *BannerList;

/**
 *  顶部广告轮播视图
 */
@property (nonatomic , strong) CycleBannerView *bannerView;
@property (nonatomic , strong) HomeTJMenuView *TJMenuView;
@property (nonatomic)NSArray *menuList;


@end
