//
//  SelectionCell.h
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
@class SelectionDataList,SelectionCellFrame;

@protocol SelectionCellPlayDelegate <NSObject>

- (void)playClick:(NSDictionary *)dic;

@end

@interface SelectionCell : BaseTableViewCell

@property (nonatomic) SelectionDataList *cellModel;
@property (nonatomic) SelectionCellFrame *cellFrame;
@property (nonatomic) id<SelectionCellPlayDelegate>delegate;

@property (nonatomic) NSArray *dataList;
@property (nonatomic) NSInteger btnTag;
@end
