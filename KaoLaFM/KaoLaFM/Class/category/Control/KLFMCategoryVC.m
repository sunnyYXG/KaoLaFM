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
@interface KLFMCategoryVC ()

@end

@implementation KLFMCategoryVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initRequest{
    KLFMCategoryReq *req = [KLFMCategoryReq yxg_request];
    req.yxg_url = category_hot_url;
    req.paramsDic = [KLFMCategoryReq params];
    self.request = req;
}
-(void)loadData{
    
    if (!self.request) return;
    WEAK_BLOCK_SELF(KLFMCategoryVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        block_self.baseModel = (CategoryBaseClass *)[CategoryBaseClass yy_modelWithJSON:response];
        [CategoryModel ModelResolver:block_self.baseModel VC:block_self];
    }];

}
-(void)setHotArr:(NSArray *)hotArr{
    if (!hotArr)return;
    _hotArr = hotArr;
}

//@{改变cell高度
-(void)changeCellHieght:(UIButton *)button{
    
    CategoryCell * cell = (CategoryCell *)[button superview];
    NSIndexPath * path = [self.tableView indexPathForCell:cell];
    
//    SelectionCellFrame *cellFrame = self.data[path.row];
//    cellFrame.cellHeight = cellFrame.cellHeight * 2;
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
