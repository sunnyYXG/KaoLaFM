//
//  SelectionModel.m
//  KaoLaFM
//
//  Created by rongyun on 17/5/18.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SelectionModel.h"
#import "SelectionDataModels.h"
#import "KLFMSelectionVC.h"
@interface SelectionModel()



@end

@implementation SelectionModel

+(void)ModelResolver:(id)response VC:(UIViewController *)VC{
    NSMutableArray *listMarr = [NSMutableArray new];
   SelectionBaseClass *model = (SelectionBaseClass *)[self mj_objectWithKeyValues:response];
    for (NSDictionary *dic in model.result.dataList) {
//        SelectionDataList *list = [SelectionDataList modelObjectWithDictionary:dic];
//        [listMarr addObject:list];
    }
    
//    KLFMSelectionVC *vc = (KLFMSelectionVC *)VC;
//    vc.data = listMarr;
}

@end
