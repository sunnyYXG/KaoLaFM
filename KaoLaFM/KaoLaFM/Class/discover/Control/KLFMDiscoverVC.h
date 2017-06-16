//
//  KLFMDiscoverVC.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  发现

#import "BaseTableViewController.h"
#import "DiscoverDataModels.h"

@interface KLFMDiscoverVC : BaseTableViewController

@property (nonatomic) DiscoverBaseClass *baseModel;
@property (nonatomic) NSArray *data;

@end
