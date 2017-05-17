//
//  BaseTableViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/26.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"
#import "BaseTableViewCell.h"
@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

/** 表视图*/
@property (nonatomic) BaseTableView *tableView;


/** 刷新数据*/
- (void)yxg_reloadData;

#pragma mark - 子类去重写
/** 分组数量*/
- (NSInteger)yxg_numberOfSections;

/** 某个分组的cell数量*/
- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section;

/** 某行的cell*/
- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath;

/** 点击某行*/
- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell;

/** 某行行高*/
- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath;

/** 某个组头*/
- (UIView *)yxg_headerAtSection:(NSInteger)section;

/** 某个组尾*/
- (UIView *)yxg_footerAtSection:(NSInteger)section;

/** 某个组头高度*/
- (CGFloat)yxg_sectionHeaderHeightAtSection:(NSInteger)section;

/** 某个组尾高度*/
- (CGFloat)yxg_sectionFooterHeightAtSection:(NSInteger)section;

/** 分割线偏移*/
- (UIEdgeInsets)yxg_sepEdgeInsetsAtIndexPath:(NSIndexPath *)indexPath;

/** tableview滚动位置 顶部、底部 */
-(void)yxg_scrollViewDidScroll:(UIScrollView *)scrollView;


-(NSString *)yxg_titleForHeaderInSection:(NSInteger)section;

@end
