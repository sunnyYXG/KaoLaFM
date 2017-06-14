//
//  KLFMCategoryVC.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  分类

#import "BaseTableViewController.h"
@class CategoryBaseClass;

@interface KLFMCategoryVC : BaseTableViewController

@property (nonatomic) CategoryBaseClass *baseModel;

@property (nonatomic) NSArray *hotArr;
@end
