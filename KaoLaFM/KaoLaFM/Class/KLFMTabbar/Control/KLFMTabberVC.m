//
//  KLFMTabberVC.m
//  KaoLaFM
//
//  Created by rongyun on 17/5/18.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "KLFMTabberVC.h"
#import "KLFMNewsVC.h"
#import "KLFMSelectionVC.h"
#import "KLFMFindVC.h"
#import "KLFMAnchorVC.h"
#import "KLFMClassVC.h"

#import "HomeNavTabBar.h"

#import "KLFMTabbarReq.h"

#import "TabbarDataModels.h"

@interface KLFMTabberVC ()<UIScrollViewDelegate,SCNavTabBarDelegate>
{
    NSInteger       _currentIndex;
    NSMutableArray  *_titles;
    HomeNavTabBar     *_navTabBar;
    UIScrollView    *_mainView;
}


@end

@implementation KLFMTabberVC

-(NSMutableArray *)navBars{
    if (!_navBars) {
        _navBars = [[NSMutableArray alloc]init];
    }
    return _navBars;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initRequest];
    [self loadData];

}

- (void)initRequest{
    KLFMTabbarReq *req = [KLFMTabbarReq yxg_request];
    req.yxg_url = tabbar_url;
    req.paramsDic = [KLFMTabbarReq params];
    self.request = req;
}

- (void)loadData{
    if (!self.request) return;
    WEAK_BLOCK_SELF(KLFMTabberVC);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        block_self.baseModel = (TabbarBaseClass *)[TabbarBaseClass yy_modelWithJSON:response];
        for (NSDictionary *dic in block_self.baseModel.result.dataList) {
            TabbarDataList *list = [TabbarDataList modelObjectWithDictionary:dic];
            [block_self.navBars addObject:list];
        }
        
        [block_self initControl];
        [block_self initConfig];
        [block_self viewConfig];

    }];
}


-(void)initControl
{
    
    NSArray *arr = @[[KLFMNewsVC description],[KLFMSelectionVC description],[KLFMClassVC description],[KLFMFindVC description],[KLFMAnchorVC description]];
    
    NSMutableArray *viewArray = [NSMutableArray array];
    
    
    for (NSInteger i =0; i < arr.count; i ++) {
        TabbarDataList *list = _navBars[i];
        [viewArray addObject:[self addChildViewControllerWithClassname:arr[i] title:list.name]];
    }
    
    _subViewControllers = [NSArray array];
    _subViewControllers = viewArray;
}

- (UIViewController *)addChildViewControllerWithClassname:(NSString *)classname title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];
    vc.title = title;
    return vc;
}

- (void)initConfig
{
    _currentIndex = 1;
    
    _titles = [[NSMutableArray alloc] initWithCapacity:_subViewControllers.count];
    
    for (UIViewController *viewController in _subViewControllers)
    {
        [_titles addObject:viewController.title];
    }
}

- (void)viewConfig
{
    [self viewInit];
    
    //首先加载第二个视图
    UIViewController *viewController = (UIViewController *)_subViewControllers[1];
    viewController.view.frame = CGRectMake(0 , 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [_mainView addSubview:viewController.view];
    [self addChildViewController:viewController];
    
    //默认显示第二个VC
    [_mainView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];

}

- (void)viewInit
{
    _navTabBar = [[HomeNavTabBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , 44)];
    _navTabBar.backgroundColor = [UIColor whiteColor];
    
    _navTabBar.delegate = self;
    _navTabBar.lineColor = _navTabBarLineColor;
    _navTabBar.itemTitles = _titles;
    [_navTabBar updateData:1];
    [self.view addSubview:_navTabBar];
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _mainView.delegate = self;
    _mainView.pagingEnabled = YES;
    _mainView.bounces = _mainViewBounces;
    _mainView.showsHorizontalScrollIndicator = NO;
    _mainView.showsVerticalScrollIndicator = NO;
    _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * _subViewControllers.count, 0);
    [self.view addSubview:_mainView];
    

    
}

#pragma mark - Scroll View Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
    _navTabBar.currentItemIndex = _currentIndex;
    
    /** 当scrollview滚动的时候加载当前视图 */
    UIViewController *viewController = (UIViewController *)_subViewControllers[_currentIndex];
    viewController.view.frame = CGRectMake(_currentIndex * SCREEN_WIDTH, 0, SCREEN_WIDTH, _mainView.frame.size.height);
    [_mainView addSubview:viewController.view];
    [self addChildViewController:viewController];
}
- (void)itemDidSelectedWithIndex:(NSInteger)index withCurrentIndex:(NSInteger)currentIndex
{
    if (currentIndex-index>=2 || currentIndex-index<=-2) {
        [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:NO];
    }else{
        [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:YES];
    }
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
