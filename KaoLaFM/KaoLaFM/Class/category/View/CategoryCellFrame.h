//
//  CategoryCellFrame.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryDataList.h"

@interface CategoryCellFrame : NSObject

@property (nonatomic) CategoryDataList *cellModel;
@property (nonatomic) CGFloat cellHeight;
@property (nonatomic) CGFloat cellSubtract;//cell高度 -- 低
@property (nonatomic) CGFloat cellHeighten;//cell高度 -- 高


/**
 *左边按钮位置：leftRect_default原始位置，leftRect_update改变后位置
 */
@property (nonatomic) CGRect leftRect_default;
@property (nonatomic) CGRect leftRect_update;


/**
 左边View高度：height_default原始高度，height_update改变后高度
 */
@property (nonatomic) CGFloat height_default;
@property (nonatomic) CGFloat height_update;


/**
 存放所有按钮rect
 */
@property (nonatomic) NSArray *rects;


/**
 存放需要创建rect的dataList数据
 */
@property (nonatomic) NSArray *data;


/**
 是否需要展开和收缩
 */
@property (nonatomic) BOOL is_heighten;


/**
 收缩按钮的位置
 */
@property (nonatomic) CGRect subBtnRect;

@end
