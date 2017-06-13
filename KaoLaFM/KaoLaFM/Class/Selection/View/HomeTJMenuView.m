//
//  HomeTJMenuView.m
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeTJMenuView.h"

@implementation HomeTJMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}
-(UIScrollView *)sc{
    if (!_sc) {
        _sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        _sc.showsHorizontalScrollIndicator = FALSE;//水平滚动条是否显示
        _sc.backgroundColor = [UIColor whiteColor];
        _sc.userInteractionEnabled = YES;

    }
    return _sc;
}
-(void)setMenus:(NSArray *)menus{
    [self addSubview:self.sc];

    for (NSInteger i = 0; i < menus.count; i ++) {
        
        CGFloat w = (SCREEN_WIDTH-60)/4;

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Html5ImageIsTap:)];
        tap.numberOfTouchesRequired = 1;
        tap.numberOfTapsRequired = 1;
        tap.delegate = self;

        
        UIImageView *IV = [[UIImageView alloc]initWithFrame:CGRectMake(i * (w + 10) + 10, 10, w, self.height - 20)];
        IV.tag = 100 + i;
        IV.userInteractionEnabled = YES;
        [IV addGestureRecognizer:tap];
        [IV sd_setImageWithURL:menus[i]];
        
        [self.sc addSubview:IV];
    }
    [self.sc setContentSize:CGSizeMake(SCREEN_WIDTH * 2, 100)];

}


- (void)Html5ImageIsTap:(UITapGestureRecognizer *)tap {
    
    NSString *url = self.h5_urls[tap.view.tag - 100];
//    if ([self.delegate respondsToSelector:@selector(HomeTJMenuPushWithURL:)]) {
//        [self.delegate HomeTJMenuPushWithURL:url];
//    }
    
    if (self.itemsBlock) {
        self.itemsBlock(tap.view.tag - 100);
    }
    
}

@end
