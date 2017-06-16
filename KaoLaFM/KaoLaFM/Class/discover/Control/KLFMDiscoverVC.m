//
//  KLFMDiscoverVC.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//  发现

#import "KLFMDiscoverVC.h"
#import "KLFMDiscoverReq.h"
#import "DiscoverModel.h"
#import "DiscoverCell.h"
@interface KLFMDiscoverVC ()

@end

@implementation KLFMDiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];

    // Do any additional setup after loading the view.
}

- (void)initRequest{
    KLFMDiscoverReq *req = [KLFMDiscoverReq yxg_request];
    req.paramsDic = [KLFMDiscoverReq params];
    req.yxg_url = discover_url;
    self.request = req;
}

-(void)loadData{
    if (!self.request) return;
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMDiscoverVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [block_self stopProgress];
        
        block_self.baseModel = (DiscoverBaseClass *)[DiscoverBaseClass yy_modelWithJSON:response];
        [DiscoverModel ModelResolverWithDiscoverModel:block_self.baseModel VC:block_self];
        
    }];
}

-(NSInteger)yxg_numberOfSections{
    return 1;
}
-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverCell *cell = [DiscoverCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    
    return cell;
}

-(void)setData:(NSArray *)data{
    if (!data) return;
    _data = data;
    [self yxg_reloadData];
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
