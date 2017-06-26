//
//  SubscribeModel.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SubscribeModel.h"
#include "SubscribeDataModels.h"
#import "KLFMSubscribeVC.h"
#import "SubscribeCellFrame.h"

@implementation SubscribeModel

+(void)ModelResolver:(SubscribeBaseClass *)baseModel VC:(UIViewController *)VC{
    
    
    NSMutableArray *marr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in baseModel.result.dataList) {
        SubscribeCellFrame *cellFrame = [SubscribeCellFrame new];
        cellFrame.cellModel = [SubscribeDataList modelObjectWithDictionary:dic];
        [marr addObject:cellFrame];
    }
    KLFMSubscribeVC *vc = (KLFMSubscribeVC *)VC;
    vc.dataList = marr;
}

@end
