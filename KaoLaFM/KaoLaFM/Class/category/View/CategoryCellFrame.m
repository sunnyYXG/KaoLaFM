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
    
    self.leftIconRectA = CGRectMake(0, 0, SCREEN_WIDTH/4, _h);
    self.leftIconRectB = CGRectMake(0, 0, SCREEN_WIDTH/4, _h * n);

    self.cellHeight = _h + 5;
    self.cellSubtract = self.cellHeight;
    self.cellHeighten = _h * n + 5;

}

@end
