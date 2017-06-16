//
//  DiscoverModel.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "DiscoverModel.h"
#import "DiscoverCellFrame.h"
#import "KLFMDiscoverVC.h"
@implementation DiscoverModel

+(void)ModelResolverWithDiscoverModel:(DiscoverBaseClass *)baseModel VC:(UIViewController *)VC{
    
    NSMutableArray *marr = [NSMutableArray new];
    for (NSDictionary *dic in baseModel.result.dataList) {
        DiscoverDataList *list = (DiscoverDataList *)[DiscoverDataList modelObjectWithDictionary:dic];
        DiscoverCellFrame *cellFrame = [DiscoverCellFrame new];
        cellFrame.cellModel = list;
        [marr addObject:cellFrame];
    }
    
    KLFMDiscoverVC *vc = (KLFMDiscoverVC *)VC;
    vc.data = marr;
    
}
@end
