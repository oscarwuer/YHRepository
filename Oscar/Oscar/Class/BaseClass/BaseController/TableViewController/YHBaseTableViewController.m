//
//  YHBaseTableViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHBaseTableViewController.h"

@implementation YHBaseTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    /// 初始化下拉刷新和上拉加载更多操作
    typeof(YHBaseTableViewController) *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf pullToRefreshAction];
    }];
    [self.tableView setShowsPullToRefresh:NO];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf infiniteScrollingAction];
    }];
    [self.tableView setShowsInfiniteScrolling:NO];
    
}

#pragma mark - tableView deletage && datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

#pragma mark - setup SVPullToRefresh

- (void)setShowsPullToRefresh:(BOOL)showsPullToRefresh{
    [self.tableView setShowsPullToRefresh:showsPullToRefresh];
}

- (void)triggerPullToRefresh{
    [self.tableView triggerPullToRefresh];
}

- (void)pullToRefreshAction{
    
}

/*!
 *  trigger
 */
- (void)triggerPullToRefreshAction{
    
}

- (void)stopPullAnnimation{
    [self.tableView.pullToRefreshView stopAnimating];
}

#pragma mark -

- (void)setShowsInfiniteScrolling:(BOOL)showsInfiniteScrolling{
    [self.tableView setShowsInfiniteScrolling:showsInfiniteScrolling];
}

/// need subClass override
- (void)infiniteScrollingAction{
    
}

- (void)stopInfiniteAnimation{
    [self.tableView.infiniteScrollingView stopAnimating];
}



#pragma mark - init views
-(UITableView *)tableView
{
    if (!_tableView)
    {
        CGRect rect = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - kTabbarHeight);
        _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

@end
