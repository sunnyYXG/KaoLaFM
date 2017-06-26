//
//  SubscribeCellFrame.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SubscribeCellFrame.h"
#import "SubscribeDataModels.h"

#define IMG_width 75

@implementation SubscribeCellFrame

-(NSMutableArray *)labelRects{
    if (!_labelRects) {
        _labelRects = [[NSMutableArray alloc]init];
    }
    return _labelRects;
}

-(void)setCellModel:(SubscribeDataList *)cellModel{
    if (_cellModel == cellModel && cellModel) return;
    _cellModel = cellModel;
    
    CGFloat LABEL_height = (IMG_width - 10)/3;
    
    self.IMGrect = CGRectMake(10, 2, IMG_width, IMG_width);
    
    CGFloat right = self.IMGrect.origin.x + self.IMGrect.size.width + 10;
    self.nameRect = CGRectMake(right, self.IMGrect.origin.y + 5, SCREEN_WIDTH - right - 100, LABEL_height);
    
    CGFloat bottom = self.nameRect.origin.y + LABEL_height;
    self.descRect = CGRectMake(right, bottom, SCREEN_WIDTH - right - 100, LABEL_height);
    
    bottom = self.descRect.origin.y + LABEL_height + 3;
    
    self.cellHeight = IMG_width + 4;
    
    self.labels = cellModel.labels;
    for (NSInteger i = 0; i < self.labels.count; i ++) {
        CGFloat w = [HelperTools widthForString:self.labels[i] fontSize:12.0f andHeight:LABEL_height - 3] + 10;
        CGRect rect = CGRectMake(right, bottom, w, LABEL_height - 3);
        right = right + w + 5;
        NSValue *value = [HelperTools withFrame:rect];
        [self.labelRects addObject:value];
    }
    
    bottom = self.nameRect.origin.y + LABEL_height - 10;
    right = self.descRect.origin.x + self.descRect.size.width + 10;
    self.subscribeRect = CGRectMake(right, bottom, SCREEN_WIDTH - right - 10, LABEL_height + 10);
    
}

@end
