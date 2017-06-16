//
//  CategoryBroadCell.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "CategoryBroadCell.h"

@implementation CategoryBroadCell

-(void)setCellFrame:(CategoryCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) return;
    _cellFrame = cellFrame;
    
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    for (NSInteger i = 0; i < cellFrame.rects.count; i ++) {
        CGRect rect= [HelperTools withNSValue:cellFrame.rects[i]];
        if (cellFrame.is_heighten && i == 7) {
            [self createButtonWith:rect tag:66 action:@selector(broadCellHieght:) hidden:NO];
            [self createButtonWith:cellFrame.subBtnRect tag:88 action:@selector(broadCellHieght:) hidden:YES];
        }else{
            NSDictionary *dic = (NSDictionary *)cellFrame.data[i];
            [self createLabelWith:rect tag:i title:dic[@"name"] action:@selector(lableTapAction:)];
            
        }
        if (i == 7) {
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
    
    for (NSInteger i = 7; i < cellFrame.rects.count; i ++) {
        CGRect rect= [HelperTools withNSValue:cellFrame.rects[i]];
        NSDictionary *dic = (NSDictionary *)cellFrame.data[i];
        [self createLabelWith:rect tag:i title:dic[@"name"] action:@selector(lableTapAction:)];
        
    }
    
}

#pragma mark - label 点击事件 跳转
- (void)lableTapAction:(UITapGestureRecognizer *)tap{
    //     BaseViewController *vc = (BaseViewController *)[[CategoryCell new] viewController];
    UILabel *label = (UILabel *)tap.view;
    DDLog(@"调频label:%@",self.cellFrame.data[label.tag]);
}

#pragma mark - 改变cell的布局 subtract cell收缩时 移除控件
-(void)subtract:(CategoryCellFrame *)cellFrame{
    //展开按钮
    UIButton *heighten_button = (UIButton *)[self viewWithTag:66];
    heighten_button.hidden = NO;
    
    //收缩按钮
    UIButton *button_subtract = (UIButton *)[self viewWithTag:88];
    button_subtract.hidden = YES;
    
    for (NSInteger i = 7; i < cellFrame.rects.count; i ++) {
        UILabel *label = (UILabel *)[self viewWithTag:i];
        [label removeFromSuperview];
    }
    
}


#pragma mark - 调低cell的高度
-(void)broadCellHieght:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(broadCellHieght_change:)]) {
        [_delegate broadCellHieght_change:sender];
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

-(void)createLabelWith:(CGRect)rect tag:(NSInteger)tag title:(NSString *)title action:(SEL)action {
    
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    [label setBackgroundColor:[UIColor whiteColor]];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = tag;
    label.textColor = UIColorFromRGB(140, 140, 140);
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [label addGestureRecognizer:tap];
    [self addSubview:label];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
