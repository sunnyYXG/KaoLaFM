//
//  KLFMNavBar.m
//  KaoLaFM
//
//  Created by rongyun on 2017/5/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "KLFMNavBar.h"

@implementation KLFMNavBar
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.iHeadImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"head_image"]];
    [self addSubview:self.iHeadImage];
    [self.iHeadImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    self.iSearchButton = [UIButton new];
    [self.iSearchButton setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [self addSubview:self.iSearchButton];
    [self.iSearchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-20);
        make.top.mas_equalTo(32);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    self.iUpdateButton = [UIButton new];
    [self.iUpdateButton setBackgroundImage:[UIImage imageNamed:@"update"] forState:UIControlStateNormal];
    [self addSubview:self.iUpdateButton];
    [self.iUpdateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.iSearchButton.mas_left).offset(-20);
        make.top.mas_equalTo(self.iSearchButton.mas_top);
        make.width.mas_equalTo(self.iSearchButton.mas_width);
        make.height.mas_equalTo(self.iSearchButton.mas_height);
    }];

    self.ihistoryButton = [UIButton new];
    [self.ihistoryButton setBackgroundImage:[UIImage imageNamed:@"history"] forState:UIControlStateNormal];
    [self addSubview:self.ihistoryButton];
    [self.ihistoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.iUpdateButton.mas_left).offset(-20);
        make.top.mas_equalTo(self.iSearchButton.mas_top);
        make.width.mas_equalTo(self.iSearchButton.mas_width);
        make.height.mas_equalTo(self.iSearchButton.mas_height);
    }];

    [self.ihistoryButton addTarget:self action:@selector(historyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.iUpdateButton addTarget:self action:@selector(updateClick) forControlEvents:UIControlEventTouchUpInside];
    [self.iSearchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageClick)];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    self.iHeadImage.userInteractionEnabled = YES;
    [self.iHeadImage addGestureRecognizer:tap];


}

- (void)headImageClick{
    DDLog(@"点击头像");
}
- (void)historyClick{
    DDLog(@"点击历史记录");

}
- (void)updateClick{
    DDLog(@"点击下载");
}
- (void)searchClick{
    DDLog(@"点击搜索");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
