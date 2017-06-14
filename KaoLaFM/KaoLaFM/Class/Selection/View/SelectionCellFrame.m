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
    if(_cellModel == cellModel && _cellModel) return;
    _cellModel = cellModel;
    self.cellHeight = 40;
    [self handelModelWithComponentType:cellModel.componentType withHasmore:cellModel.hasmore];
    self.titleRect = CGRectMake(10, 15, SCREEN_WIDTH/2, 30);
    
    if (self.hasmoreType == SelectionCellType_Hasmore) {
        self.hasmoreRect = CGRectMake(SCREEN_WIDTH - 40, 18, 23, 23);
    }
    
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
    CGFloat _y = 0;
    CGFloat _w = SCREEN_WIDTH - 20;
    CGFloat _h = (SCREEN_WIDTH - 20)/3;
    CGFloat _t = self.titleRect.origin.y * 2 + self.titleRect.size.height;

    for (NSInteger i = 0; i < model.dataList.count; i ++) {
        _y = i%3;
        CGRect tagViewRect = CGRectMake(10, _t + _y * (_h + 10), _w, _h);
        [self.mArrRects addObject:[HelperTools withFrame:tagViewRect]];
    }
    _y++;
    self.cellHeight = self.titleRect.origin.y * 2 + self.titleRect.size.height + _y * (_h + 10) + 20;
    
    self.lineRect = CGRectMake(0, self.cellHeight - 10, SCREEN_WIDTH, 10);

}

- (void)createFrameComponentType_Three:(SelectionDataList *)model{
    
    CGFloat _y = 0;
    CGFloat _x = 0;
    CGFloat _w = (SCREEN_WIDTH - 40)/3;
    CGFloat _h = _w + _w/3 + 20;
    CGFloat _t = self.titleRect.origin.y * 2 + self.titleRect.size.height;
    for (NSInteger i = 0; i < model.dataList.count; i ++) {
        _x = i%3;
        _y = i/3;
        CGRect tagViewRect = CGRectMake(10 + _x * (_w + 10), _t + _y * (_h + 10), _w, _h);
        [self.mArrRects addObject:[HelperTools withFrame:tagViewRect]];
    }
    _y++;
    self.cellHeight = self.titleRect.origin.y * 2 + self.titleRect.size.height + _y * (_h + 10) + 20;
    
    self.lineRect = CGRectMake(0, self.cellHeight - 10, SCREEN_WIDTH, 10);
}

- (void)createFrameComponentType_Project:(SelectionDataList *)model{
    
    CGFloat _w = 60;
    CGFloat _h = _w;
    CGFloat _bottom = (SCREEN_WIDTH-3*_w)/3;
    CGFloat _x = 0;

    for (NSInteger i = 0; i < model.dataList.count; i ++) {

        _x = _bottom/2 * i;
        CGRect rect = CGRectMake(_bottom + i * _h + _x, 10, _w, _h);
        [self.mArrRects addObject:[HelperTools withFrame:rect]];
    }
    
    self.cellHeight = 120;
    
    self.lineRect = CGRectMake(0, self.cellHeight - 10, SCREEN_WIDTH, 10);

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
