//
//  DiscoverCellFrame.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "DiscoverCellFrame.h"

@implementation DiscoverCellFrame

-(void)setCellModel:(DiscoverDataList *)cellModel{
    if (_cellModel == cellModel && _cellModel) return;
    _cellModel = cellModel;
}

@end
