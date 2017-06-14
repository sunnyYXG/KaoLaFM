//
//  CategoryModel.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "CategoryModel.h"
#import "KLFMCategoryVC.h"
#import "CategoryDataModels.h"
#import "CategoryCellFrame.h"

@implementation CategoryModel

+ (void)ModelResolver:(CategoryBaseClass *)baseModel VC:(UIViewController *)VC{
    
    NSMutableArray *marr = [NSMutableArray new];
    
    for (NSDictionary *dic in baseModel.result.dataList) {
        CategoryDataList *list = (CategoryDataList *)[CategoryDataList yy_modelWithDictionary:dic];
        CategoryCellFrame *cellFrame = [CategoryCellFrame new];
        cellFrame.cellModel = list;
        [marr addObject:cellFrame];
    }
    
    KLFMCategoryVC *vc = (KLFMCategoryVC *)VC;
    vc.hotArr = marr;
}

@end
