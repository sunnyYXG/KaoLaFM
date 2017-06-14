//
//  CategoryCell.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"

@protocol CategoryCellChangeHeightDelegate <NSObject>

-(void)changeCellHieght:(UIButton *)button;

@end

@interface CategoryCell : BaseTableViewCell

@property (nonatomic) id<CategoryCellChangeHeightDelegate> delegate;

@end
