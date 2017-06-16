//
//  DiscoverCellFrame.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoverDataModels.h"

@interface DiscoverCellFrame : NSObject

@property (nonatomic) DiscoverDataList *cellModel;

@property (nonatomic) CGRect pic_rect;
@property (nonatomic) CGRect rname_rect;
@property (nonatomic) CGRect line_rect;
@property (nonatomic) CGRect rightBtn_rect;
@property (nonatomic) CGRect des_rect;
@property (nonatomic) NSString *webUrl;

@property (nonatomic) CGFloat cellHeight;

@end
