//
//  CategoryModel.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "CategoryModel.h"
#import "CategoryDataModels.h"
#import "CategoryCellFrame.h"

@implementation CategoryModel

+ (void)ModelResolver:(CategoryBaseClass *)baseModel VC:(UIViewController *)VC type:(CategoryDataComponentType)dataType{
    
    NSMutableArray *marr = [NSMutableArray new];
    
    
    KLFMCategoryVC *vc = (KLFMCategoryVC *)VC;
    switch (dataType) {
        case CategoryDataType_hot:
            for (NSDictionary *dic in baseModel.result.dataList) {
                CategoryDataList *list = (CategoryDataList *)[CategoryDataList yy_modelWithDictionary:dic];
                CategoryCellFrame *cellFrame = [CategoryCellFrame new];
                cellFrame.cellModel = list;
                [marr addObject:cellFrame];
            }
            vc.hotArr = marr;
            break;
            
        case CategoryDataType_other:
            for (NSDictionary *dic in baseModel.result.dataList) {
                CategoryDataList *list = (CategoryDataList *)[CategoryDataList yy_modelWithDictionary:dic];
                [marr addObject:list];
            }
            vc.otherArr = marr;
            break;

        default:
            break;
    }
}


+(void)ModelResolverWithBroadModel:(BroadBaseClass *)broadModel VC:(UIViewController *)VC{
    NSMutableArray *marr = [NSMutableArray new];
    
    KLFMCategoryVC *vc = (KLFMCategoryVC *)VC;

    CategoryCellFrame *cellFrame = [CategoryCellFrame new];
    cellFrame.broadModel = broadModel.result;

    [marr addObject:cellFrame];
    vc.broadArr = marr;
}
@end
