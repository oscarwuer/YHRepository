//
//  DebugPullViewController.m
//  Oscar
//
//  Created by yahui.zhang on 16/2/23.
//  Copyright © 2016年 yahui.zhang. All rights reserved.
//

#import "SVPullRefreshVC.h"
#import "YHCellCatalog.h"

@interface SVPullRefreshVC ()

@end

@implementation SVPullRefreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SVPullToRefresh";
    
    /// 开启下拉功能
    [self setShowsPullToRefresh:YES];
    [self triggerPullToRefresh];
    
    /// 开启上拉加载功能
    [self setShowsInfiniteScrolling:YES];
    
    /// 加载数据源
    [self configDatasource];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

- (void)configDatasource{
    [self resetActions];
    
    NSMutableArray *cellObjects = [NSMutableArray array];
    
    for (NSInteger i = 0; i<20; i++) {
        YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:[NSString stringWithFormat:@"This is %@ line",@(i+1)]];
        [cellObjects addObject:cellObject];
    }
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithSectionedArray:cellObjects delegate:self];
    [self.tableView reloadData];
}

#pragma mark - 下拉 上拉 回调
- (void)triggerPullToRefreshAction
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       [self stopPullAnnimation];
                   });
}

- (void)pullToRefreshAction
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       [self stopPullAnnimation];
                   });
}

- (void)infiniteScrollingAction
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       [self stopInfiniteAnimation];
                       [self setShowsInfiniteScrolling:NO];
                   });
}

@end
