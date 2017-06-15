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
    
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }
    
    self.left_bgView = [[UIView alloc]initWithFrame:cellFrame.leftRect_default];
    self.left_bgView.backgroundColor = [UIColor whiteColor];

    self.leftView = [[UIView alloc]initWithFrame:cellFrame.leftRect_default];
    self.leftView.backgroundColor = [UIColor whiteColor];
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.leftView.width/4, 10, self.leftView.width/2, self.leftView.width/2)];
    [leftBtn sd_setImageWithURL:[NSURL URLWithString:cellFrame.cellModel.icon] forState:UIControlStateNormal];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, leftBtn.bottom, self.leftView.width, self.leftView.height - leftBtn.bottom - 10)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = cellFrame.cellModel.title;
    title.textColor = UIColorFromRGB(140, 140, 140);
    title.backgroundColor = [UIColor whiteColor];
    
    [self.leftView addSubview:title];
    [self.leftView addSubview:leftBtn];
    [self.left_bgView addSubview:self.leftView];
    [self addSubview:self.left_bgView];
    
    for (NSInteger i = 0; i < cellFrame.rects.count; i ++) {
        CGRect rect= [HelperTools withNSValue:cellFrame.rects[i]];
        if (cellFrame.is_heighten && i == 5) {
            [self createButtonWith:rect tag:66 action:@selector(heightenCellHieght:) hidden:NO];
            [self createButtonWith:cellFrame.subBtnRect tag:88 action:@selector(subtractCellHieght:) hidden:YES];
        }else{
            UILabel *title = [[UILabel alloc]initWithFrame:rect];
            [title setBackgroundColor:[UIColor whiteColor]];
            [self addSubview:title];
            NSDictionary *dic = (NSDictionary *)cellFrame.data[i];
            title.text = dic[@"title"];
            title.textAlignment = NSTextAlignmentCenter;
            title.tag = i;
            title.textColor = UIColorFromRGB(140, 140, 140);

        }
        if (i == 5) {
            break;
        }
    }
}

#pragma mark - 改变cell的布局 heighten cell展开时 添加控件
-(void)heighten:(CategoryCellFrame *)cellFrame{
    //展开按钮
    UIButton *heighten_button = (UIButton *)[self viewWithTag:66];
    heighten_button.hidden = YES;
    

    //收缩按钮
    UIButton *button_subtract = (UIButton *)[self viewWithTag:88];
    button_subtract.hidden = NO;
    //图片翻转
    [UIView animateWithDuration:0.5 animations:^{
        button_subtract.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }];

    //更新高度和位置
//    [self.left_bgView setHeight:cellFrame.height_update];
//    self.leftView.frame = cellFrame.leftRect_update;
    WeakSelf(blockWeak);
    [UIView animateWithDuration:0.2 animations:^{
        [blockWeak.left_bgView setHeight:cellFrame.height_update];
    }];
    [UIView animateWithDuration:0.3 animations:^{
        blockWeak.leftView.frame = cellFrame.leftRect_update;
    }];


    
    for (NSInteger i = 5; i < cellFrame.rects.count; i ++) {
        CGRect rect= [HelperTools withNSValue:cellFrame.rects[i]];
        UILabel *title = [[UILabel alloc]initWithFrame:rect];
        [title setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:title];
        NSDictionary *dic = (NSDictionary *)cellFrame.data[i];
        title.text = dic[@"title"];
        title.textAlignment = NSTextAlignmentCenter;
        title.tag = i;
        title.textColor = UIColorFromRGB(140, 140, 140);

    }

}
#pragma mark - 改变cell的布局 subtract cell收缩时 移除控件
-(void)subtract:(CategoryCellFrame *)cellFrame{
    //展开按钮
    UIButton *heighten_button = (UIButton *)[self viewWithTag:66];
    heighten_button.hidden = NO;
    
    //收缩按钮
    UIButton *button_subtract = (UIButton *)[self viewWithTag:88];
    button_subtract.hidden = YES;
    

    //回到原始高度和位置
    WeakSelf(blockWeak);
    [UIView animateWithDuration:0.3 animations:^{
        blockWeak.leftView.frame = cellFrame.leftRect_default;
    }];
    [UIView animateWithDuration:0.1 animations:^{
        [blockWeak.left_bgView setHeight:cellFrame.height_default];
    }];


    for (NSInteger i = 5; i < cellFrame.rects.count; i ++) {
        UILabel *label = (UILabel *)[self viewWithTag:i];
        [label removeFromSuperview];
    }

}

#pragma mark - 调低cell的高度
-(void)subtractCellHieght:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(subtractCellHieght:)]) {
        [_delegate subtractCellHieght:sender];
    }
}
#pragma mark - 调高cell的高度
-(void)heightenCellHieght:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(heightenCellHieght:)]) {
        [_delegate heightenCellHieght:sender];
    }
}

-(void)createButtonWith:(CGRect)rect tag:(NSInteger)tag action:(SEL)action hidden:(BOOL)hidden{
    
    UIButton *button = [[UIButton alloc]initWithFrame:rect];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    [button setImage:[UIImage imageNamed:@"heighten_icon"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.hidden = hidden;
    [self addSubview:button];
    

}

@end
