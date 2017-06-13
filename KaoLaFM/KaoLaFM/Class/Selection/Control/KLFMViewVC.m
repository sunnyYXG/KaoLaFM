//
//  KLFMViewVC.m
//  KaoLaFM
//
//  Created by sunny_FX on 2017/6/10.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "KLFMViewVC.h"

@interface KLFMViewVC ()

@end

@implementation KLFMViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ceshi";
//    self.navigationController.navigationBar.hidden = NO;
    [self.navBar configureViewWithTitle:@"" Type:KLFMNavBarTypeBack];
    [self.view addSubview:self.navBar];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *buton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    buton.backgroundColor = [UIColor redColor];
    [self.view addSubview:buton];
    [buton addTarget:self action:@selector(butclck) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
- (void)butclck{

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
