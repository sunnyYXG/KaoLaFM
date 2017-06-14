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

@interface KLFMCategoryVC ()<CategoryCellChangeHeightDelegate>

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
    return 1;
}
-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCellFrame *cellFrame = self.hotArr[indexPath.row];
    return cellFrame.cellHeight;
}
-(UIView *)yxg_headerAtSection:(NSInteger)section{
    return nil;
}
-(NSString *)yxg_titleForHeaderInSection:(NSInteger)section{
//    switch (section) {
//        case 0:
//            return @"热门分类";
//            break;
//        case 1:
//            return @"其他分类";
//            break;
//        case 2:
//            return @"调频";
//            break;
//            
//        default:
//            break;
//    }
    return @"";
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *cell = [CategoryCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    CategoryCellFrame *cellFrame = self.hotArr[indexPath.row];
    cell.cellFrame = cellFrame;
    return cell;
}


//@{改变cell高度
-(void)changeCellHieght:(UIView *)view{
    
    CategoryCell * cell = (CategoryCell *)[[view superview] superview];
    NSIndexPath * path = [self.tableView indexPathForCell:cell];
    
    CategoryCellFrame *cellFrame = self.hotArr[path.row];
    cellFrame.cellHeight = cellFrame.cellHeightB;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
}

-(void)changeCellHieghtRight:(UIButton *)button{
    CategoryCell * cell = (CategoryCell *)[button superview];
    NSIndexPath * path = [self.tableView indexPathForCell:cell];
    
    CategoryCellFrame *cellFrame = self.hotArr[path.row];
    cellFrame.cellHeight = cellFrame.cellHeightA;
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
