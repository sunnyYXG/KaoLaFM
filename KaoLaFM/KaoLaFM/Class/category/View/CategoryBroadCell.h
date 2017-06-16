//
//  CategoryBroadCell.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CategoryCellFrame.h"
#import "BroadDataModels.h"

@protocol CategoryBroadCellChangeHeightDelegate <NSObject>

-(void)broadCellHieght_change:(UIButton *)button;

@end


@interface CategoryBroadCell : BaseTableViewCell

@property (nonatomic) id<CategoryBroadCellChangeHeightDelegate> delegate;

@property (nonatomic) CategoryCellFrame *cellFrame;


//改变cell的布局
- (void)heighten:(CategoryCellFrame *)cellFrame;
- (void)subtract:(CategoryCellFrame *)cellFrame;

@end
