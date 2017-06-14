//
//  CategoryCell.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)changeCellHeight:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(changeCellHieght:)]) {
        [_delegate changeCellHieght:sender];
    }
}

@end
