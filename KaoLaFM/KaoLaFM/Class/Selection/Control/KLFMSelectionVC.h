//
//  KLFMSelectionVC.h
//  KaoLaFM
//
//  Created by rongyun on 17/5/17.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewController.h"
@class SelectionBaseClass;

@interface KLFMSelectionVC : BaseTableViewController


@property (nonatomic) NSArray *data;
@property (nonatomic) NSMutableArray *frameArr;

@property (nonatomic) SelectionBaseClass *baseModel;

@end
