//
//  SubscribeCell.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
@class SubscribeCellFrame;

typedef void (^SubscribeCellBlock)(NSString *name);

@interface SubscribeCell : BaseTableViewCell

@property (nonatomic) SubscribeCellFrame *cellFrame;
@property (nonatomic,copy) SubscribeCellBlock cellBlock;

@end
