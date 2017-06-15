//
//  CategoryCellFrame.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "CategoryCellFrame.h"
#define _h 100

@implementation CategoryCellFrame

-(void)setCellModel:(CategoryDataList *)cellModel{
    if(_cellModel == cellModel && _cellModel) return;
    _cellModel = cellModel;
    
    NSInteger n = cellModel.dataList.count / 3 + 1;
    //以下判断不需要  因为如果以下条件成立的话 会增加一行新的 用来展示收缩按钮
//    if (cellModel.dataList.count % 3 == 0) {
//        n--;
//    }
    CGFloat w = (SCREEN_WIDTH-3)/4;

    self.height_default = _h;
    self.height_update = _h * n/2;
    
    self.leftRect_default = CGRectMake(0, 0, w, _h);
    self.leftRect_update = CGRectMake(0, (self.height_update-_h)/2, w, _h);

    self.cellHeight = _h + 5;
    self.cellSubtract = self.cellHeight;
    self.cellHeighten = _h * n/2 + 5;

    self.data = cellModel.dataList;
    self.rects = [HelperTools rectWithCreateUIWithLeft:w + 1 top:0 num:3 width:w height:49 Vertical:1 Horizontal:1 arr:self.data];
    self.subBtnRect = CGRectMake(SCREEN_WIDTH - w,  (n-1) * 50, w, 49);
    if (cellModel.dataList.count > 6) {
        self.is_heighten = YES;
    }
}

@end
