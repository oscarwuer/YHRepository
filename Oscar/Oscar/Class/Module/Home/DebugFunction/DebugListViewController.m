//
//  DebugListViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "DebugListViewController.h"

@interface DebugListViewController ()

@end

@implementation DebugListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    /// 开启下拉功能
    [self setShowsPullToRefresh:YES];
    [self triggerPullToRefresh];
    
    /// 开启上拉加载功能
    [self setShowsInfiniteScrolling:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0f green:arc4random()%255/256.0f blue:arc4random()%255/256.0f alpha:1.0f];
    }
    return cell;
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
