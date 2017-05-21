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

@interface KLFMSelectionVC ()

@end

@implementation KLFMSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}

- (void)initRequest{
    KLFMSelectionReq *req = [KLFMSelectionReq yxg_request];
    req.yxg_url = selection_url;
    req.paramsDic = [KLFMSelectionReq params];
    self.request = req;
}


- (void)loadData{
    if (!self.request) return;
    WEAK_BLOCK_SELF(KLFMSelectionVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        
        self.baseModel = (SelectionBaseClass *)[SelectionBaseClass yy_modelWithJSON:response];
        [SelectionModel ModelResolver:block_self.baseModel VC:block_self];

        
    }];
}

-(void)setData:(NSArray *)data{
    _data = data;
    
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
