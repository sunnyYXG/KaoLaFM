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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeCellHeight:)];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    
    tap.delegate = self;

    UIView *leftView = [[UIView alloc]initWithFrame:cellFrame.leftIconRectA];
    [self addSubview:leftView];
    
    UIImageView *leftBtn = [[UIImageView alloc]initWithFrame:CGRectMake(leftView.width/4, 10, leftView.width/2, leftView.width/2)];
    leftBtn.userInteractionEnabled = YES;
    [leftBtn sd_setImageWithURL:[NSURL URLWithString:cellFrame.cellModel.icon]];
    [leftBtn addGestureRecognizer:tap];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, leftBtn.bottom, leftView.width, leftView.height - leftBtn.bottom - 10)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = cellFrame.cellModel.title;
    
    leftView.backgroundColor = UIColorFromRGB(248, 248, 248);
    title.backgroundColor = [UIColor whiteColor];
    
    [leftView addSubview:title];
    [leftView addSubview:leftBtn];
    [self addSubview:leftView];
    
    

}

-(void)changeCellHieghtRight:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(changeCellHieghtRight:)]) {
        [_delegate changeCellHieghtRight:sender];
    }
}

-(void)changeCellHeight:(UITapGestureRecognizer *)tap{
    
    if (_delegate && [_delegate respondsToSelector:@selector(changeCellHieght:)]) {
        [_delegate changeCellHieght:tap.view];
    }
}

@end
