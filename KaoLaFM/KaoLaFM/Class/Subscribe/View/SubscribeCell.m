//
//  SubscribeCell.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SubscribeCell.h"
#import "SubscribeCellFrame.h"
#import "SubscribeDataList.h"

@implementation SubscribeCell

-(void)setCellFrame:(SubscribeCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) return;
    _cellFrame = cellFrame;
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIImageView *IV = [[UIImageView alloc]initWithFrame:cellFrame.IMGrect];
    UILabel *nameLab = [Factory createLabelWithTitle:cellFrame.cellModel.name fontSize:14.0f];
    UILabel *descLab = [Factory createLabelWithTitle:cellFrame.cellModel.desc fontSize:14.0f];

    NSURL *imageUrl = [NSURL URLWithString:cellFrame.cellModel.img];
    [IV sd_setImageWithURL:imageUrl];
    nameLab.frame = cellFrame.nameRect;
    descLab.frame = cellFrame.descRect;
    
    [self.contentView addSubview:IV];
    [self.contentView addSubview:nameLab];
    [self.contentView addSubview:descLab];
    
    for (NSInteger i = 0; i <cellFrame.labelRects.count; i++) {
        [self.contentView addSubview:[self labelWithFrame:[HelperTools withNSValue:cellFrame.labelRects[i]] title:cellFrame.labels[i]]];
    }
    
    [self.contentView addSubview:[self buttonWith:cellFrame.subscribeRect]];

}

/*
 订阅--响应事件
 */
- (void)subscribeButtonClickDelegate:(UIButton *)sender{
    if (self.cellBlock) {
        self.cellBlock(_cellFrame.cellModel.name);
    }
}

/*
 标签集合
 */
- (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title{
    UILabel *label = [Factory createLabelWithTitle:title fontSize:12.0f];
    label.frame = frame;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = reportColor;
    label.layer.borderWidth = 1;
    label.layer.borderColor = reportColor.CGColor;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 4.0f;
    return label;
}

/*
 订阅
 */
- (UIButton *)buttonWith:(CGRect)frame{
    UIButton *subscribeBtn = [Factory createButtonWithTitle:@"订阅" target:self selector:@selector(subscribeButtonClickDelegate:)];
    subscribeBtn.frame = frame;
    subscribeBtn.backgroundColor = [UIColor whiteColor];
    subscribeBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [subscribeBtn setTitleColor:UIColorFromRGB(216, 79, 79) forState:UIControlStateNormal];
    subscribeBtn.layer.borderWidth = 1;
    subscribeBtn.layer.borderColor = UIColorFromRGB(216, 79, 79).CGColor;
    subscribeBtn.layer.masksToBounds = YES;
    subscribeBtn.layer.cornerRadius = 15.0f;
    return subscribeBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
