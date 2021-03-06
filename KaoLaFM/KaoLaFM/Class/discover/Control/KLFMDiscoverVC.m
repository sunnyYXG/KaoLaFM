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
    
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, self.tableView.height - 108 - playerViewHeight);
    self.tableView.frame = frame;


    // Do any additional setup after loading the view.
}


-(void)loadData{
    if (![BaseRequest sharedManager]) return;
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMDiscoverVC);
    [[BaseRequest sharedManager] yxg_sendRequestWithMethod:GET WithURL:discover_url paramsDic:[KLFMDiscoverReq params] Completion:^(id response, BOOL success, NSString *message) {
        [block_self.tableView.mj_header endRefreshing];
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
    cell.cellFrame = (DiscoverCellFrame *)_data[indexPath.row];
    return cell;
}

-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverCellFrame *cellFrame = (DiscoverCellFrame *)_data[indexPath.row];
    return  cellFrame.cellHeight;
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
