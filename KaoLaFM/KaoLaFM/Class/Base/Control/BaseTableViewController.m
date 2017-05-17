//
//  BaseTableViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/26.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseTableHeaderFooterView.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
//    self.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeBottom;
//    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0) {
        //            self.edgesForExtendedLayout = UIRectEdgeNone;
//    }

}

/**
 *  加载tableview
 */
- (BaseTableView *)tableView {
    if(!_tableView){
        BaseTableView *tab = [[BaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tab];
        _tableView = tab;
        tab.dataSource = self;
        tab.delegate = self;
        tab.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
        tab.separatorColor = [UIColor grayColor];
        tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 刷新数据*/
- (void)yxg_reloadData {
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
// 分组数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self respondsToSelector:@selector(yxg_numberOfSections)]) {
        return self.yxg_numberOfSections;
    }
    return 0;
}

// 指定组返回的cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(yxg_numberOfRowsInSection:)]) {
        return [self yxg_numberOfRowsInSection:section];
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(yxg_headerAtSection:)]) {
        return [self yxg_headerAtSection:section];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(yxg_footerAtSection:)]) {
        return [self yxg_footerAtSection:section];
    }
    return nil;
}

// 每一行返回指定的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self respondsToSelector:@selector(yxg_cellAtIndexPath:)]) {
        return [self yxg_cellAtIndexPath:indexPath];
    }
    // 1. 创建cell
    BaseTableViewCell *cell = [BaseTableViewCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    
    // 2. 返回cell
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self respondsToSelector:@selector(yxg_scrollViewDidScroll:)]) {
        [self yxg_scrollViewDidScroll:scrollView];
    }
}

// 点击某一行 触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([self respondsToSelector:@selector(yxg_didSelectCellAtIndexPath:cell:)]) {
        [self yxg_didSelectCellAtIndexPath:indexPath cell:cell];
    }
}

// 每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(yxg_cellheightAtIndexPath:)]) {
        return [self yxg_cellheightAtIndexPath:indexPath];
    }
    return tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(yxg_sectionHeaderHeightAtSection:)]) {
        return [self yxg_sectionHeaderHeightAtSection:section];
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(yxg_sectionFooterHeightAtSection:)]) {
        return [self yxg_sectionFooterHeightAtSection:section];
    }
    return 0.01;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([self respondsToSelector:@selector(yxg_titleForHeaderInSection:)]) {
        return [self yxg_titleForHeaderInSection:section];
    }
    return @"";
}

- (NSInteger)yxg_numberOfSections { return 0; }

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section { return 0; }

- (UITableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath { return [BaseTableViewCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]]; }

- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath { return 0; }

- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell { }

- (UIView *)yxg_headerAtSection:(NSInteger)section { return [BaseTableHeaderFooterView headerFooterViewWithTableView:self.tableView]; }

- (UIView *)yxg_footerAtSection:(NSInteger)section { return [BaseTableHeaderFooterView headerFooterViewWithTableView:self.tableView]; }

- (CGFloat)yxg_sectionHeaderHeightAtSection:(NSInteger)section { return 0.01; }

- (CGFloat)yxg_sectionFooterHeightAtSection:(NSInteger)section { return 0.01; }

- (UIEdgeInsets)yxg_sepEdgeInsetsAtIndexPath:(NSIndexPath *)indexPath { return UIEdgeInsetsMake(0, 15, 0, 0); }
- (NSString *)yxg_titleForHeaderInSection:(NSInteger)section {return @"";}

- (void)dealloc { [[NSNotificationCenter defaultCenter] removeObserver:self]; }

-(void)yxg_scrollViewDidScroll:(UIScrollView *)scrollView { }

@end
