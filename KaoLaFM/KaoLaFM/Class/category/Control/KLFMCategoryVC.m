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
    
}

- (void)initRequest{
    KLFMCategoryReq *req = [KLFMCategoryReq yxg_request];
    req.yxg_url = category_hot_url;
    req.paramsDic = [KLFMCategoryReq params];
    self.request = req;
    
    KLFMCategoryReq *otherReq = [KLFMCategoryReq yxg_request];
    otherReq.yxg_url = category_other_url;
    otherReq.paramsDic = [KLFMCategoryReq params];
    self.otherRequest = otherReq;
    
    KLFMCategoryReq *broadReq = [KLFMCategoryReq yxg_request];
    broadReq.yxg_url = category_broad_url;
    broadReq.paramsDic = [KLFMCategoryReq params];
    self.broadRequest = broadReq;


}
-(void)loadData{
    if (!self.request) return;
    _titles = @[@"热门分类",@"其他人类",@"调频"];
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMCategoryVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
        [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_hot];
    }];
    
    [self.otherRequest yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
        [CategoryModel ModelResolver:block_self.baseModel VC:block_self type:CategoryDataType_other];
    }];
    
    [self.broadRequest yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        block_self.broadModel = (BroadBaseClass *)[BroadBaseClass yy_modelWithJSON:response];
        [CategoryModel ModelResolverWithBroadModel:block_self.broadModel VC:block_self];
    }];



}
-(void)setHotArr:(NSArray *)hotArr{
    if (!hotArr)return;
    _hotArr = hotArr;
    [self yxg_reloadData];
}

-(void)setBroadArr:(NSArray *)broadArr{
    if (!broadArr)return;
    _broadArr = broadArr;
    [self yxg_reloadData];
}

-(void)setOtherArr:(NSArray *)otherArr{
    if (!otherArr)return;
    _otherArr = otherArr;
    [self yxg_reloadData];

}

-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return self.hotArr.count;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;

        default:
            break;
    }
    return 0;

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
    if (indexPath.section == 0) {
        CategoryCell *cell = [CategoryCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellWithCategory_Hot_WithCell:cell indexRow:indexPath.row];
        return cell;
    }else if (indexPath.section == 1){
        CategoryOtherCell *cell = [CategoryOtherCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellWithCategory_Other_WithCell:cell];
        return cell;
    }else{
        CategoryBroadCell *cell = [CategoryBroadCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellWithCategory_Broad_WithCell:cell indexRow:indexPath.row];
        return cell;
    }
    
    
    return nil;
}

- (void)cellWithCategory_Hot_WithCell:(CategoryCell *)cell indexRow:(NSInteger)row{
    CategoryCellFrame *cellFrame = self.hotArr[row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    cell.backgroundColor = tableViewBackColor;
    cell.cellFrame = cellFrame;
}

- (void)cellWithCategory_Other_WithCell:(CategoryOtherCell *)cell{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = tableViewBackColor;
    cell.dataList = self.otherArr;
}

- (void)cellWithCategory_Broad_WithCell:(CategoryBroadCell *)cell indexRow:(NSInteger)row{
    CategoryCellFrame *cellFrame = self.broadArr[row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = tableViewBackColor;
    cell.delegate = self;
    cell.cellFrame = cellFrame;
}


#pragma mark - CategoryCellChangeHeightDelegate
#pragma mark - cell的高度调整
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

}

#pragma mark - CategoryBroadCellChangeHeightDelegate
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
