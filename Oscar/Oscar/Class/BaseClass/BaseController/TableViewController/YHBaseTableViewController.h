//
//  YHBaseTableViewController.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHBaseViewController.h"
#import <SVPullToRefresh.h>

@interface YHBaseTableViewController : YHBaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

#pragma mark - 下拉刷新

/**
 *  设置是否显示下拉刷新控件
 *
 *  @param showsPullToRefresh (YES为显示, NO为隐藏)
 */
- (void)setShowsPullToRefresh:(BOOL)showsPullToRefresh;

/// 触发下拉刷新
- (void)triggerPullToRefresh;

/// 下拉刷新时, 会回调的操作 need subClass override
- (void)pullToRefreshAction;

/// trigger 下拉刷新时, 会回调的操作 need subClass override
- (void)triggerPullToRefreshAction;

/// 下拉刷新操作完成后, 停止下拉刷新动画
- (void)stopPullAnnimation;

#pragma mark - 上拉加载

/**
 *  设置是否显示滑动到底部自动加载更多控件
 *
 *  @param showsInfiniteScrolling (YES为显示, NO为隐藏)
 */
- (void)setShowsInfiniteScrolling:(BOOL)showsInfiniteScrolling;

/// 上拉加载更多时, 会回调的操作. need subClass override
- (void)infiniteScrollingAction;

/// 上拉加载更多操作完成后, 停止加载更多动画
- (void)stopInfiniteAnimation;

@end
