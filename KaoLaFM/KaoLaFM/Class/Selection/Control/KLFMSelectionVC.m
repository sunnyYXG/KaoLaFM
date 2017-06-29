//
//  KLFMSelectionVC.m
//  KaoLaFM
//
//  Created by rongyun on 17/5/17.
//  Copyright © 2017年 YXGang. All rights reserved.
//  精选

#import "KLFMSelectionVC.h"

#import "KLFMSelectionReq.h"

#import "SelectionBaseClass.h"
#import "SelectionModel.h"


#import "SelectionCell.h"
#import "SelectionCellFrame.h"

#import "CycleBannerView.h"
#import "HomeTJMenuView.h"
#import "YXGAVPlayer.h"
@interface KLFMSelectionVC ()<SelectionCellDelegate>{
    SelectionCell *_cell;
}

@end

@implementation KLFMSelectionVC

-(CycleBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[CycleBannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.55)];
        _bannerView.bgImg = [UIImage imageNamed:@"shadow.png"];
        
        //    WEAK_BLOCK_SELF(KLFMSelectionVC);
        _bannerView.clickItemBlock = ^(NSInteger index) {
        //        SelectionDataList *banner = block_self.BannerList[index];
        //        [block_self pushVc:[BannerViewController new] userInfo:@{@"bannerUrl":banner.linkUrl}];
        };
    }
    return _bannerView;
}
-(HomeTJMenuView *)TJMenuView{
    if (!_TJMenuView) {
        _TJMenuView = [[HomeTJMenuView alloc]initWithFrame:CGRectMake(0, self.bannerView.bottom, SCREEN_WIDTH, 125)];
//        _TJMenuView.delegate = self;
        WEAK_BLOCK_SELF(KLFMSelectionVC);
        _TJMenuView.itemsBlock = ^(NSInteger index) {
            DDLog(@"dinjia");
            
//            [block_self pushVc:[KLFMViewVC new] userInfo:nil];
        };
    }
    return _TJMenuView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, self.tableView.height - 108 - playerViewHeight);
    self.tableView.frame = frame;

    [self.view setHeight:self.view.height - 64];
    [self initBannerView];
}
//- (void)isPlayer_Notification:(NSNotification *)n{
//    NSDictionary *dic = n.userInfo;
//    NSNumber *yet = dic[@"isPlayer"];
////    SelectionCell *cell = [self.tableView cellForRowAtIndexPath:_indexPath];
//    
//    if ([yet boolValue]) {
//        DDLog(@"改变cell上面按钮状态--yes");
//        [_cell.last_btn setImage:[UIImage imageNamed:@"btn_player_pause_on"] forState:UIControlStateNormal];
//        _cell.last_btn.selected = YES;
//        
//        
//    }else{
//        [_cell.last_btn setImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
//        _cell.last_btn.selected = NO;
//        
//    }
//}
-(void)playerClick:(UIButton *)sender{
    SelectionCell* cell = (SelectionCell *)[[sender superview] superview];
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if (_cell != cell) {
        [_cell.last_btn setImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
        _cell.last_btn.selected = NO;
        _cell = cell;
    }

}
#pragma mark 首页轮播图
- (void)initBannerView
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.55 + 125)];
    
    [headerView addSubview:self.bannerView];
    [headerView addSubview:self.TJMenuView];
    self.tableView.tableHeaderView = headerView;

}

- (void)initRequest{
    KLFMSelectionReq *req = [KLFMSelectionReq yxg_request];
    req.yxg_url = selection_url;
    req.paramsDic = [KLFMSelectionReq params];
    self.request = req;
}


- (void)loadData{
    if (!self.request) return;
    [self startProgress];
    WEAK_BLOCK_SELF(KLFMSelectionVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        [self stopProgress];
        [block_self.tableView.mj_header endRefreshing];
        if (success) {
            block_self.baseModel = (SelectionBaseClass *)[SelectionBaseClass yy_modelWithJSON:response];
            [SelectionModel ModelResolver:block_self.baseModel VC:block_self];
            [block_self yxg_reloadData];
        }else{
            [block_self showError:@"数据在火星..."];
        }
        
    }];
}

-(void)setData:(NSArray *)data{
    _data = data;
    [self yxg_reloadData];
}

-(void)setBannerList:(NSArray *)BannerList{
    self.bannerView.aryImg = BannerList;
}
-(void)setMenuList:(NSArray *)menuList{
    self.TJMenuView.menus = menuList;
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
-(NSInteger)yxg_numberOfSections{
    return 1;
}
-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    SelectionCell *cell = [SelectionCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    SelectionCellFrame *cellFrame = self.data[indexPath.row];
    cell.cellFrame = cellFrame;
    cell.delegate = self;
    _cell = cell;
    return cell;
}
-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    SelectionCellFrame *cellFrame = self.data[indexPath.row];
    return cellFrame.cellHeight;
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
