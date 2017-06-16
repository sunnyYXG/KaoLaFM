//
//  DiscoverCellFrame.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "DiscoverCellFrame.h"

#define pic_width 30

@implementation DiscoverCellFrame

-(void)setCellModel:(DiscoverDataList *)cellModel{
    if (_cellModel == cellModel && _cellModel) return;
    _cellModel = cellModel;
    
    self.pic_rect = CGRectMake(20, 20, pic_width, pic_width);
    
    CGFloat _X = self.pic_rect.origin.x + pic_width * 2;
    self.rname_rect = CGRectMake(_X, self.pic_rect.origin.y,(SCREEN_WIDTH - _X)/2, pic_width);
    
    CGFloat _Y = self.rname_rect.origin.y + self.rname_rect.size.height + pic_width;
    self.line_rect = CGRectMake(_X - pic_width/2, _Y, SCREEN_WIDTH - _X, 1);
    
    self.cellHeight = _Y+1;
}

@end
