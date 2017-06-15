//
//  KLFMCategoryVC.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  分类

#import "BaseTableViewController.h"
@class CategoryBaseClass;

typedef NS_ENUM(NSInteger,CategoryDataComponentType) {
    CategoryDataType_hot = 0,       //热门分类
    CategoryDataType_other = 1,     //其他分类
    CategoryDataType_broad = 2,     //调频
};

@interface KLFMCategoryVC : BaseTableViewController

@property (nonatomic) CategoryBaseClass *baseModel;
@property (nonatomic) CategoryDataComponentType dataType;

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
