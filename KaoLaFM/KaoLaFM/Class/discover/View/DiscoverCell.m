//
//  DiscoverCell.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "DiscoverCell.h"

@implementation DiscoverCell

-(void)setCellFrame:(DiscoverCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) return;
    _cellFrame = cellFrame;
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    
    UIImageView *pic = [[UIImageView alloc]initWithFrame:cellFrame.pic_rect];
    [pic sd_setImageWithURL:[NSURL URLWithString:cellFrame.cellModel.pic]];
    [self addSubview:pic];
    
    UILabel *rname = [[UILabel alloc]initWithFrame:cellFrame.rname_rect];
    rname.text = cellFrame.cellModel.rname;
    rname.textAlignment = NSTextAlignmentLeft;
    [self addSubview:rname];
    
    UIView *line = [[UIView alloc]initWithFrame:cellFrame.line_rect];
    line.backgroundColor = tableViewBackColor;
    [self addSubview:line];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
