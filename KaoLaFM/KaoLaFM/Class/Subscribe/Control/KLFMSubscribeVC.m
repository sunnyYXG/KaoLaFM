//
//  KLFMSubscribeVC.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  订阅

#import "KLFMSubscribeVC.h"
#import "SubscribeBaseClass.h"
#import "SubscribeModel.h"
#import "KLFMSubscribeReq.h"
#import "SubscribeCell.h"
#import "SubscribeCellFrame.h"

@interface KLFMSubscribeVC ()

@end

@implementation KLFMSubscribeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, self.tableView.height - 108 - playerViewHeight);
    self.tableView.frame = frame;
}

-(void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self yxg_reloadData];
}

-(void)initRequest{
    
    KLFMSubscribeReq *req = [KLFMSubscribeReq yxg_request];
    req.yxg_url = subscribe_url;
    req.paramsDic = [KLFMSubscribeReq params];
    self.request = req;
}

-(void)loadData{
    if (!self.request) return;
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMSubscribeVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [block_self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        if (success) {
            block_self.baseModel = (SubscribeBaseClass *)[SubscribeBaseClass yy_modelWithJSON:response];
            [SubscribeModel ModelResolver:block_self.baseModel VC:block_self];
        }
    }];
}

-(NSInteger)yxg_numberOfSections{
    return 1;
}
-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    SubscribeCellFrame *cellFrame = (SubscribeCellFrame *)self.dataList[indexPath.row];
    return cellFrame.cellHeight;
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    SubscribeCell *cell = [SubscribeCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    SubscribeCellFrame *cellFrame = self.dataList[indexPath.row];
    cell.cellFrame = cellFrame;
    WEAK_BLOCK_SELF(KLFMSubscribeVC);
    cell.cellBlock = ^(NSString *name) {
        [block_self SubscribeCellBlock:name];
    };
    return cell;
}

#pragma mark - SubscribeCellBlock
- (void)SubscribeCellBlock:(NSString *)name{
    DDLog(@"订阅-name:%@",name);
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
