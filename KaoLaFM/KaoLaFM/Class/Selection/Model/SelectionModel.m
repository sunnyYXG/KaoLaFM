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
#import "SelectionCellFrame.h"
@interface SelectionModel()



@end

@implementation SelectionModel

+(NSDictionary *)ModelResolver:(SelectionBaseClass *)baseModel VC:(UIViewController *)VC{
    NSMutableArray *listMarr = [NSMutableArray new];
    NSMutableArray *BannerList = [NSMutableArray new];
    NSMutableArray *menuList = [NSMutableArray new];

    for (NSDictionary *dic in baseModel.result.dataList) {
                SelectionDataList *list = [SelectionDataList modelObjectWithDictionary:dic];
        DDLog(@"%@-%.0f-%.0f-%.0f-%.0f",list.name,list.hasmore,list.moreType,list.componentType,list.contentType);
        
        if (list.moreType != 0) {
            [listMarr addObject:list];
        }
        /*
         hasmore = 1 右上角有按钮   =0 没有按钮
         
         componentType = 3 一行3个  =29 单列(换一换按钮) =27专题活动商城  =32自定义（频道自选）
         
         */

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

    NSMutableArray *marr = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < listMarr.count; i ++) {
        SelectionCellFrame *cellFrame = [SelectionCellFrame new];
        cellFrame.cellModel = (SelectionDataList *)listMarr[i];
        [marr addObject:cellFrame];
    }

    KLFMSelectionVC *vc = (KLFMSelectionVC *)VC;
    vc.BannerList = BannerList;
    vc.menuList = menuList;
    vc.data = marr;

    return @{};

}
@end
