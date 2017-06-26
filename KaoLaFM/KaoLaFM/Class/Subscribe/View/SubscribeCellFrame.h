//
//  SubscribeCellFrame.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  SubscribeDataList;

@interface SubscribeCellFrame : NSObject

@property (nonatomic) SubscribeDataList *cellModel;


/**
 图片
 */
@property (nonatomic) CGRect IMGrect;

/**
 标签rects
 */
@property (nonatomic,strong) NSMutableArray *labelRects;

/**
 标签集合
 */
@property (nonatomic) NSArray *labels;

/**
 介绍
 */
@property (nonatomic) CGRect descRect;

/**
 标题
 */
@property (nonatomic) CGRect nameRect;

/**
 订阅
 */
@property (nonatomic) CGRect subscribeRect;

/**
 cell 高度
 */
@property (nonatomic) CGFloat cellHeight;

@end
