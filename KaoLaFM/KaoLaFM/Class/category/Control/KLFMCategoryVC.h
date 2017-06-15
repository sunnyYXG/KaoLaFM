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

/**
 热门分类
 */
@property (nonatomic) NSArray *hotArr;

/**
 其他分类
 */
@property (nonatomic) NSArray *otherArr;

/**
 调频
 */
@property (nonatomic) NSArray *broadArr;



@end
