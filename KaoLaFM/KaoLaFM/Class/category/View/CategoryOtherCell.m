//
//  CategoryOtherCell.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "CategoryOtherCell.h"
#import "CategoryDataList.h"
@implementation CategoryOtherCell

-(void)setDataList:(NSArray *)dataList{
    if (_dataList == dataList && _dataList) return;
    _dataList = dataList;
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    CGFloat w = (SCREEN_WIDTH-3)/4;
    NSArray *rects = [HelperTools rectWithCreateUIWithLeft:1 top:0 num:4 width:w height:100 Vertical:1 Horizontal:1 arr:dataList];
    
    for (NSInteger i = 0; i <rects.count; i ++) {
        CategoryDataList *cellModel = (CategoryDataList *)dataList[i];

        CGRect rect = [HelperTools withNSValue:rects[i]];
        UIView *view = [[UIView alloc]initWithFrame:rect];
        view.backgroundColor = [UIColor whiteColor];
        
        UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(view.width/4, 10, view.width/2, view.width/2)];
        [leftBtn sd_setImageWithURL:[NSURL URLWithString:cellModel.icon] forState:UIControlStateNormal];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, leftBtn.bottom, view.width, view.height - leftBtn.bottom - 10)];
        title.textAlignment = NSTextAlignmentCenter;
        title.text = cellModel.title;
        title.textColor = UIColorFromRGB(140, 140, 140);
        title.backgroundColor = [UIColor whiteColor];
        
        [view addSubview:title];
        [view addSubview:leftBtn];
        [self addSubview:view];
    }
    
    self.cellHeight = dataList.count/4 *100;

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
