//
//  SelectionCell.h
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
@class SelectionDataList,SelectionCellFrame;


@interface SelectionCell : BaseTableViewCell

@property (nonatomic) SelectionDataList *cellModel;
@property (nonatomic) SelectionCellFrame *cellFrame;

@end
