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

-(void)hotCellHieght_change:(UIButton *)button;

@end

@interface CategoryCell : BaseTableViewCell

@property (nonatomic) id<CategoryCellChangeHeightDelegate> delegate;
@property (nonatomic) CategoryCellFrame *cellFrame;

@property (nonatomic) UIView *left_bgView;
@property (nonatomic) UIView *leftView;

//改变cell的布局
- (void)heighten:(CategoryCellFrame *)cellFrame;
- (void)subtract:(CategoryCellFrame *)cellFrame;

@end
