//
//  KLFMSubscribeVC.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  订阅

#import "BaseTableViewController.h"
@class SubscribeBaseClass;

@interface KLFMSubscribeVC : BaseTableViewController

@property (nonatomic) SubscribeBaseClass *baseModel;
@property (nonatomic) NSArray *dataList;
@end
