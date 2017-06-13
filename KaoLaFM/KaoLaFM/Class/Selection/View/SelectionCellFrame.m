//
//  SelectionCellFrame.m
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SelectionCellFrame.h"
#import "SelectionDataList.h"

@implementation SelectionCellFrame

-(NSMutableArray *)mArrRects{
    if (!_mArrRects) {
        _mArrRects = [[NSMutableArray alloc]init];
    }
    return _mArrRects;
}

-(void)setCellModel:(SelectionDataList *)cellModel{
    if(!cellModel) return;
    _cellModel = cellModel;
    self.cellHeight = 40;
    [self handelModelWithComponentType:cellModel.componentType withHasmore:cellModel.hasmore];
    
    self.titleRect = CGRectMake(10, 15, SCREEN_WIDTH/2, 30);
    
    switch (self.componentType) {
        case SelectionCellComponentType_Single:
            [self createFrameComponentType_Single:cellModel];
            break;
            
        case SelectionCellComponentType_Three:
            [self createFrameComponentType_Three:cellModel];
            break;
            
        case SelectionCellComponentType_Project:
            [self createFrameComponentType_Project:cellModel];
            break;
            
        case SelectionCellComponentType_Other:
            [self createFrameComponentType_Other:cellModel];
            break;

        default:
            break;
    }
}

- (void)createFrameComponentType_Single:(SelectionDataList *)model{
    
}

- (void)createFrameComponentType_Three:(SelectionDataList *)model{
    
    CGFloat _y = 0;
    CGFloat _x = 0;
    CGFloat _w = (SCREEN_WIDTH - 40)/3;
    CGFloat _h = _w + _w/3;
    
    for (NSInteger i = 0; i < model.dataList.count; i ++) {
        _x = i%3;
        _y = i/3;
        CGRect tagViewRect = CGRectMake(10 + _x * (_w + 10), 60 + _y * (_h + 10), _w, _h);
        [self.mArrRects addObject:[HelperTools withFrame:tagViewRect]];
    }
    _y++;
    self.cellHeight = self.titleRect.origin.y * 2 + self.titleRect.size.height + _y * (_h + 10);
}

- (void)createFrameComponentType_Project:(SelectionDataList *)model{
    
}

- (void)createFrameComponentType_Other:(SelectionDataList *)model{
    
}

- (void)handelModelWithComponentType:(double)componentType withHasmore:(double)hasmore{
    if (componentType == 3) self.componentType = SelectionCellComponentType_Three;
    if (componentType == 27) self.componentType = SelectionCellComponentType_Project;
    if (componentType == 29) self.componentType = SelectionCellComponentType_Single;
    if (componentType == 32) self.componentType = SelectionCellComponentType_Other;
    
    if (hasmore == 0) self.hasmoreType = SelectionCellType_NoMore;
    if (hasmore == 1) self.hasmoreType = SelectionCellType_Hasmore;
}

@end
