//
//  SelectionCell.m
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SelectionCell.h"
#import "SelectionCellFrame.h"
@implementation SelectionCell

-(void)setCellModel:(SelectionDataList *)cellModel{
    if (!cellModel) return;
    _cellModel = cellModel;

}

-(void)setCellFrame:(SelectionCellFrame *)cellFrame{
    if (!cellFrame) return;
    _cellFrame = cellFrame;
    _cellModel = cellFrame.cellModel;
    
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
