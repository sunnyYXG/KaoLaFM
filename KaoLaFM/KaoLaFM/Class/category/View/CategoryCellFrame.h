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

@property (nonatomic) CGRect leftIconRectA;
@property (nonatomic) CGRect leftIconRectB;


@end
