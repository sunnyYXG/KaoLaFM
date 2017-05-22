//
//  SelectionCellFrame.m
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SelectionCellFrame.h"

@implementation SelectionCellFrame

-(void)setCellModel:(SelectionDataList *)cellModel{
    if(!cellModel) return;
    _cellModel = cellModel;
}

@end
