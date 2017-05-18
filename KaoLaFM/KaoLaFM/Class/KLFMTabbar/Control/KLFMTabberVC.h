//
//  KLFMTabberVC.h
//  KaoLaFM
//
//  Created by rongyun on 17/5/18.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseViewController.h"
#import "TabbarBaseClass.h"

@interface KLFMTabberVC : BaseViewController

@property (nonatomic, assign)   BOOL        scrollAnimation;            // Default value: NO
@property (nonatomic, assign)   BOOL        mainViewBounces;            // Default value: NO

@property (nonatomic, strong)NSArray *subViewControllers;

@property (nonatomic, strong)UIColor  *navTabBarColor;
@property (nonatomic, strong)UIColor  *navTabBarLineColor;

@property (nonatomic) NSMutableArray *navBars;

@property (nonatomic) TabbarBaseClass *baseModel;

@end
