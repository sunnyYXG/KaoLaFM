//
//  HomeNavTabBar.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//




#import "KLFMNavigateView.h"
#import "NSString+Extension.h"

#define line_X 15

@interface KLFMNavigateView ()
{
    UIScrollView    *_navgationTabBar;
    UIView          *_line;                 // underscore show which item selected
    NSArray         *_itemsWidth;           // an array of items' width
    NSInteger          lastBtnIndex;
    CGFloat            _lineX;
}
@end

@implementation KLFMNavigateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor orangeColor];
        [self initConfig];
    }
    return self;
}

- (void)initConfig
{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    _items = [@[] mutableCopy];
    [self viewConfig];
}

- (void)viewConfig
{
    _navgationTabBar = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 44)];
    _navgationTabBar.backgroundColor = [UIColor clearColor];
    _navgationTabBar.showsHorizontalScrollIndicator = NO;
    [self addSubview:_navgationTabBar];
}

- (void)updateData:(NSInteger)lastIndex
{
    lastBtnIndex = lastIndex;
    _itemsWidth = [self getButtonsWidthWithTitles:_itemTitles];
    if (_itemsWidth.count)
    {
        CGFloat contentWidth = [self contentWidthAndAddNavTabBarItemsWithButtonsWidth:_itemsWidth];
        _navgationTabBar.contentSize = CGSizeMake(contentWidth, 0);

    }
    
}

- (CGFloat)contentWidthAndAddNavTabBarItemsWithButtonsWidth:(NSArray *)widths
{
    CGFloat buttonX = 0;
    
    for (NSInteger index = 0; index < [_itemTitles count]; index++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:_itemTitles[index] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        CGSize textMaxSize = CGSizeMake(SCREEN_WIDTH, MAXFLOAT);
        CGSize textRealSize = [_itemTitles[index] sizeWithFont:[UIFont systemFontOfSize:16] maxSize:textMaxSize].size;
        
        //TODO:更改之前
//        textRealSize = CGSizeMake(textRealSize.width + line_X*2, 35);

        //TODO:更改之后
        _lineX = (SCREEN_WIDTH/5 - textRealSize.width)/2;
        textRealSize = CGSizeMake(SCREEN_WIDTH/5, 35);

        button.frame = CGRectMake(buttonX, 0,textRealSize.width, 35);
        
        button.tag = 100 + index;
        //字体颜色
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        [button addTarget:self action:@selector(itemPressed:type:) forControlEvents:UIControlEventTouchUpInside];
        [_navgationTabBar addSubview:button];
        [_items addObject:button];
        buttonX += button.frame.size.width;
        
    }
    
    [self showLineWithButtonWidth:[widths[lastBtnIndex] floatValue]];
    return buttonX;
}

#pragma mark  下划线
- (void)showLineWithButtonWidth:(CGFloat)width
{
    UIButton *button = (UIButton *)[_navgationTabBar viewWithTag:101];
    //第一个线的位置
    //TODO:更改之前 button.frame.origin.x + 15
    _line = [[UIView alloc] initWithFrame:CGRectMake(button.frame.origin.x , 34, width, 2.0f)];
    _line.backgroundColor = [UIColor redColor];
    [_navgationTabBar addSubview:_line];
    
    UIButton *btn = _items[lastBtnIndex];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];


    [self itemPressed:btn type:0];
}

- (void)itemPressed:(UIButton *)button type:(int)type
{
    NSInteger index = [_items indexOfObject:button];
    [_delegate itemDidSelectedWithIndex:index withCurrentIndex:_currentItemIndex];
}

//计算数组内字体的宽度
- (NSArray *)getButtonsWidthWithTitles:(NSArray *)titles;
{
    NSMutableArray *widths = [@[] mutableCopy];
    
    for (NSString *title in titles)
    {
        CGSize textMaxSize = CGSizeMake(SCREEN_WIDTH, MAXFLOAT);
        CGSize textRealSize = [title sizeWithFont:[UIFont systemFontOfSize:16] maxSize:textMaxSize].size;
       
        NSNumber *width = [NSNumber numberWithFloat:textRealSize.width];
        [widths addObject:width];
    }
  
    return widths;
}

#pragma mark 偏移
- (void)setCurrentItemIndex:(NSInteger)currentItemIndex
{
    _currentItemIndex = currentItemIndex;
    UIButton *button = _items[currentItemIndex];

    if (lastBtnIndex != currentItemIndex) {
        UIButton *lastButton = _items[lastBtnIndex];
        [lastButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        lastButton.titleLabel.font = [UIFont systemFontOfSize:16];

        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18];

        lastBtnIndex = currentItemIndex;
    }
    
//    CGFloat flag = SCREEN_WIDTH - 40;
    
//    if (button.frame.origin.x + button.frame.size.width + 50 >= flag)
//    {
//        CGFloat offsetX = button.frame.origin.x + button.frame.size.width - flag;
//        if (_currentItemIndex < [_itemTitles count]-1)
//        {
//            offsetX = offsetX + button.frame.size.width;
//        }
//        [_navgationTabBar setContentOffset:CGPointMake(offsetX, 0) animated:NO];
//        
//    }
//    else
//    {
        [_navgationTabBar setContentOffset:CGPointMake(0, 0) animated:YES];
//    }
       //下划线的偏移量
    //TODO:更新
    //MARK:更新
    //FIXME:
    [UIView animateWithDuration:0.1f animations:^{
        //TODO:更改之前 button.frame.origin.x + 15
        _line.frame = CGRectMake(button.frame.origin.x + _lineX, _line.frame.origin.y, [_itemsWidth[currentItemIndex] floatValue], _line.frame.size.height);
    }];
}
@end
