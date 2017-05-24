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
    NSMutableArray *BannerList = [NSMutableArray new];
    NSMutableArray *menuList = [NSMutableArray new];

    for (NSDictionary *dic in baseModel.result.dataList) {
                SelectionDataList *list = [SelectionDataList modelObjectWithDictionary:dic];
                [listMarr addObject:list];
        DDLog(@"%@-%.0f-%.0f-%.0f-%.0f",list.name,list.hasmore,list.moreType,list.componentType,list.contentType);
    }
    //顶部滚动图片
    SelectionDataList *SelectionData = (SelectionDataList *)[listMarr firstObject];
    [listMarr removeObjectAtIndex:0];

    for (NSDictionary *dic in SelectionData.dataList) {
        SelectionDataList *list = [SelectionDataList modelObjectWithDictionary:dic];
        [BannerList addObject:list.pic];
    }
    
    
    SelectionDataList *menus = (SelectionDataList *)[listMarr firstObject];
    [listMarr removeObjectAtIndex:0];
    
    for (NSDictionary *dic in menus.dataList) {
        SelectionDataList *list = [SelectionDataList modelObjectWithDictionary:dic];
        [menuList addObject:list.pic];
    }

    KLFMSelectionVC *vc = (KLFMSelectionVC *)VC;
    vc.BannerList = BannerList;
    vc.menuList = menuList;

    vc.data = listMarr;

    return @{};

}
@end
