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

+(NSDictionary *)ModelResolver:(SelectionBaseClass *)baseModel VC:(UIViewController *)VC{
    NSMutableArray *listMarr = [NSMutableArray new];
    for (NSDictionary *dic in baseModel.result.dataList) {
                SelectionDataList *list = [SelectionDataList modelObjectWithDictionary:dic];
                [listMarr addObject:list];
    }
    
        KLFMSelectionVC *vc = (KLFMSelectionVC *)VC;
        vc.data = listMarr;
    
    return @{};

}
@end
