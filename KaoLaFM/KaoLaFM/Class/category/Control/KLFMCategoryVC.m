//
//  KLFMCategoryVC.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  分类

#import "KLFMCategoryVC.h"
#import "KLFMCategoryReq.h"

#import "CategoryDataModels.h"
#import "CategoryModel.h"
#import "CategoryCell.h"
#import "CategoryCellFrame.h"

#import "BroadDataModels.h"

#import "CategoryOtherCell.h"
#import "CategoryBroadCell.h"

@interface KLFMCategoryVC ()<CategoryCellChangeHeightDelegate,CategoryBroadCellChangeHeightDelegate>{
    NSArray *_titles;
}

@end

@implementation KLFMCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];

    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, self.tableView.height - 108 - playerViewHeight);
    self.tableView.frame = frame;
    self.tableView.hidden = YES;
}

-(void)loadData{
    /*
    if (!self.request) return;
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMCategoryVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        if (success) {
            block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
            [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_hot];
        } else {
            [block_self showError:@"数据丢失"];
        }
    }];
    
    [self.otherRequest yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        if (success) {
            block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
            [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_other];
        } else {
            [block_self showError:@"数据丢失"];
        }

    }];
    
    [self.broadRequest yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        if (success) {
            block_self.broadModel = (BroadBaseClass *)[BroadBaseClass yy_modelWithJSON:response];
            [CategoryModel ModelResolverWithBroadModel:block_self.broadModel VC:block_self];
        } else {
            [block_self showError:@"数据丢失"];
        }

    }];
     */
    [self createDispatchGroup];
//    [self blockOperation];
}
- (void)blockOperation{
    if (!self.request) return;
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMCategoryVC);

    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        DDLog(@"热门分类-开始");
        [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:category_hot_url paramsDic:[KLFMCategoryReq params] Completion:^(id response, BOOL success, NSString *message){
            if (success) {
                block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
                [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_hot];
            } else {
                [block_self showError:@"数据丢失"];
            }
            DDLog(@"热门分类-结束");
        }];
    }];
    
    [blockOperation addExecutionBlock:^{
        DDLog(@"其他分类-开始");
        [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:category_other_url paramsDic:[KLFMCategoryReq params] Completion:^(id response, BOOL success, NSString *message) {
            if (success) {
                block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
                [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_other];
            } else {
                [block_self showError:@"数据丢失"];
            }
            DDLog(@"其他分类-结束");
        }];
    }];
    
    [blockOperation addExecutionBlock:^{
        DDLog(@"调频分类-开始");
        [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:category_broad_url paramsDic:[KLFMCategoryReq params] Completion:^(id response, BOOL success, NSString *message) {
            if (success) {
                block_self.broadModel = (BroadBaseClass *)[BroadBaseClass yy_modelWithJSON:response];
                [CategoryModel ModelResolverWithBroadModel:block_self.broadModel VC:block_self];
            } else {
                [block_self showError:@"数据丢失"];
            }
            DDLog(@"调频分类-结束");
        }];
    }];

    [blockOperation start];
    
    [self stopProgress];
    self.tableView.hidden = NO;
    [self.tableView.mj_header endRefreshing];
    [self yxg_reloadData];
    DDLog(@"结束-刷新数据");
    
}
- (void)createDispatchGroup{
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMCategoryVC);

    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        DDLog(@"热门分类-开始");
        [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:category_hot_url paramsDic:[KLFMCategoryReq params] Completion:^(id response, BOOL success, NSString *message) {
            if (success) {
                block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
                [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_hot];
            } else {
                [block_self showError:@"数据丢失"];
            }
            dispatch_group_leave(group);
            DDLog(@"热门分类-结束");
        }];
    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        DDLog(@"其他分类-开始");
        [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:category_other_url paramsDic:[KLFMCategoryReq params] Completion:^(id response, BOOL success, NSString *message) {
            if (success) {
                block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
                [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_other];
            } else {
                [block_self showError:@"数据丢失"];
            }
            dispatch_group_leave(group);
            DDLog(@"其他分类-结束");
        }];
    });

    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        DDLog(@"调频分类-开始");
        [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:category_broad_url paramsDic:[KLFMCategoryReq params] Completion:^(id response, BOOL success, NSString *message) {
            if (success) {
                block_self.broadModel = (BroadBaseClass *)[BroadBaseClass yy_modelWithJSON:response];
                [CategoryModel ModelResolverWithBroadModel:block_self.broadModel VC:block_self];
            } else {
                [block_self showError:@"数据丢失"];
            }
            dispatch_group_leave(group);
            DDLog(@"调频分类-结束");
        }];
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
       dispatch_async(dispatch_get_main_queue(), ^{
           [block_self stopProgress];
           block_self.tableView.hidden = NO;
           [block_self.tableView.mj_header endRefreshing];
           [block_self yxg_reloadData];
           DDLog(@"结束-刷新数据");
       });
    });

}
-(void)setHotArr:(NSArray *)hotArr{
    if (!hotArr)return;
    _hotArr = hotArr;
}

-(void)setBroadArr:(NSArray *)broadArr{
    if (!broadArr)return;
    _broadArr = broadArr;
    _titles = @[@"热门分类",@"其他分类",@"调频"];
}

-(void)setOtherArr:(NSArray *)otherArr{
    if (!otherArr)return;
    _otherArr = otherArr;
}

-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.hotArr.count;
    }else{
        return 1;
    }
}
-(NSInteger)yxg_numberOfSections{
    return 3;
}
-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = 0;
    if (indexPath.section == 0) {
        CategoryCellFrame *cellFrame = self.hotArr[indexPath.row];
        h = cellFrame.cellHeight;
    }else if(indexPath.section == 1){
        CategoryOtherCell *cell = (CategoryOtherCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
        h = cell.cellHeight;
    }else{
        CategoryCellFrame *cellFrame = self.broadArr[indexPath.row];
        h = cellFrame.cellHeight;

    }
    return h;
}
-(UIView *)yxg_headerAtSection:(NSInteger)section{
    return nil;
}
-(NSString *)yxg_titleForHeaderInSection:(NSInteger)section{
    if (!_titles) return @"";
    switch (section) {
        case 0:
            return _titles[section];
            break;
        case 1:
            return _titles[section];
            break;
        case 2:
            return _titles[section];
            break;
            
        default:
            break;
    }
    return @"";
}
-(CGFloat)yxg_sectionHeaderHeightAtSection:(NSInteger)section{
    return 40.0f;
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *cell;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell =[CategoryCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellWithCategory_Hot_WithCell:(CategoryCell *)cell indexRow:indexPath.row];
        return cell;
    }else if (indexPath.section == 1){
         cell = [CategoryOtherCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellWithCategory_Other_WithCell:(CategoryOtherCell *)cell];
        return cell;
    }else{
         cell = [CategoryBroadCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellWithCategory_Broad_WithCell:(CategoryBroadCell *)cell indexRow:indexPath.row];
        return cell;
    }
    return nil;
}
#pragma mark - 分类
- (void)cellWithCategory_Hot_WithCell:(CategoryCell *)cell indexRow:(NSInteger)row{
    CategoryCellFrame *cellFrame = self.hotArr[row];
    cell.delegate = self;
    cell.cellFrame = cellFrame;
    cell.backgroundColor = tableViewBackColor;
}
- (void)cellWithCategory_Other_WithCell:(CategoryOtherCell *)cell{
    cell.dataList = self.otherArr;
    cell.backgroundColor = tableViewBackColor;
}
- (void)cellWithCategory_Broad_WithCell:(CategoryBroadCell *)cell indexRow:(NSInteger)row{
    CategoryCellFrame *cellFrame = self.broadArr[row];
    cell.delegate = self;
    cell.cellFrame = cellFrame;
    cell.backgroundColor = tableViewBackColor;
}


#pragma mark - CategoryCellChangeHeightDelegate && cell的高度调整
-(void)hotCellHieght_change:(UIButton *)button{
    CategoryCell * cell = (CategoryCell *)[button superview];
    NSIndexPath * path = [self.tableView indexPathForCell:cell];
    CategoryCellFrame *cellFrame = (CategoryCellFrame *)self.hotArr[path.row];
    if (button.tag == 66) {
        //更新cell的高度
        cellFrame.cellHeight = cellFrame.cellHeighten;
        [cell heighten:cellFrame];
    }else{
        //设置cell的高度 为 默认高度
        cellFrame.cellHeight = cellFrame.cellSubtract;
        [cell subtract:cellFrame];
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:path.row inSection:0];
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath  atScrollPosition:UITableViewScrollPositionMiddle animated:YES];

}

#pragma mark - CategoryBroadCellChangeHeightDelegate && cell的高度调整
-(void)broadCellHieght_change:(UIButton *)button{
    CategoryBroadCell * cell = (CategoryBroadCell *)[button superview];
    NSIndexPath * path = [self.tableView indexPathForCell:cell];
    CategoryCellFrame *cellFrame = (CategoryCellFrame *)self.broadArr[path.row];
    if (button.tag == 66) {
        //更新cell的高度
        cellFrame.cellHeight = cellFrame.cellHeighten;
        [cell heighten:cellFrame];

    }else{
        //设置cell的高度 为 默认高度
        cellFrame.cellHeight = cellFrame.cellSubtract;
        [cell subtract:cellFrame];
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
//    [self.tableView setContentOffset:CGPointMake(0, self.tableView.bottom + cellFrame.cellHeight) animated:YES];

    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:2];
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath  atScrollPosition:UITableViewScrollPositionTop animated:YES];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
