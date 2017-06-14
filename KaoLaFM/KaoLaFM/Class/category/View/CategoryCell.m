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

-(void)setCellFrame:(CategoryCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) return;
    _cellFrame = cellFrame;
    

    UIView *leftView = [[UIView alloc]initWithFrame:cellFrame.leftIconRectA];
    [self addSubview:leftView];
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftView.width/4, 10, leftView.width/2, leftView.width/2)];
    leftBtn.userInteractionEnabled = YES;
    [leftBtn sd_setImageWithURL:[NSURL URLWithString:cellFrame.cellModel.icon] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(heightenCellHieght:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, leftBtn.bottom, leftView.width, leftView.height - leftBtn.bottom - 10)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = cellFrame.cellModel.title;
    
    leftView.backgroundColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor whiteColor];
    
    [leftView addSubview:title];
    [leftView addSubview:leftBtn];
    [self addSubview:leftView];
    
    

}

#pragma mark - 调高cell的高度
-(void)subtractCellHieght:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(subtractCellHieght:)]) {
        [_delegate subtractCellHieght:sender];
    }
}
#pragma mark - 调低cell的高度
-(void)heightenCellHieght:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(heightenCellHieght:)]) {
        [_delegate heightenCellHieght:sender];
    }
}

@end
