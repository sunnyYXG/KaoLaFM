//
//  SelectionCellFrame.h
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SelectionDataList;

/**
 *  数据类型 KLFMSelectionVC.h - Tableview数据
 *          componentType = 3 一行3个  =29 单列(换一换按钮) =27专题活动商城  =32自定义（频道自选）
 */
typedef NS_ENUM(NSUInteger, SelectionCellDataComponentType) {
    /** 单列*/
    SelectionCellComponentType_Single = 1,
    /** 三列*/
    SelectionCellComponentType_Three = 2,
    /** 专题活动商城*/
    SelectionCellComponentType_Project = 3,
    /** 自定义 频道自选*/
    SelectionCellComponentType_Other = 4,
};

/**
 *  数据类型 KLFMSelectionVC.h - Tableview数据
 *          hasmore = 1 右上角有按钮   =0 没有按钮
 */
typedef NS_ENUM(NSUInteger, SelectionCellDataHasmoreType) {
    /** 没有按钮*/
    SelectionCellType_NoMore = 0,
    /** 存在按钮*/
    SelectionCellType_Hasmore = 1,
};



@interface SelectionCellFrame : NSObject

@property (nonatomic) SelectionDataList *cellModel;
@property (nonatomic) SelectionCellDataComponentType componentType;
@property (nonatomic) SelectionCellDataHasmoreType hasmoreType;
@property (nonatomic) NSMutableArray *mArrRects;

@property (nonatomic) CGRect titleRect;
@property (nonatomic) CGRect lineRect;
@property (nonatomic) CGRect hasmoreRect;

@property (nonatomic) CGFloat cellHeight;

@end
