//
//  SelectionCell.m
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SelectionCell.h"
#import "SelectionCellFrame.h"
#import "SelectionDataList.h"

@implementation SelectionCell

-(void)setCellModel:(SelectionDataList *)cellModel{
    if (!cellModel) return;
    _cellModel = cellModel;

}

-(void)setCellFrame:(SelectionCellFrame *)cellFrame{
    if (!cellFrame) return;
    _cellFrame = cellFrame;
    
    if (cellFrame.componentType == SelectionCellComponentType_Three) {
        UILabel *title = [[UILabel alloc]initWithFrame:cellFrame.titleRect];
        title.text = cellFrame.cellModel.name;
        [self addSubview:title];
//        title.backgroundColor = [UIColor orangeColor];
        
        for (NSInteger i = 0; i < cellFrame.mArrRects.count; i ++) {
            UIView *view = [[UIView alloc]initWithFrame:[HelperTools withNSValue:cellFrame.mArrRects[i]]];
            view.backgroundColor = [UIColor greenColor];
            [self addSubview:view];
        }
    }else{
        DDLog(@"暂不做调试");
    }
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
