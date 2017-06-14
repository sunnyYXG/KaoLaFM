//
//  CategoryCell.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CategoryCellFrame.h"

@protocol CategoryCellChangeHeightDelegate <NSObject>

-(void)changeCellHieght:(UIView *)view;

-(void)changeCellHieghtRight:(UIButton *)button;

@end

@interface CategoryCell : BaseTableViewCell<UIGestureRecognizerDelegate>

@property (nonatomic) id<CategoryCellChangeHeightDelegate> delegate;
@property (nonatomic) CategoryCellFrame *cellFrame;

@end
