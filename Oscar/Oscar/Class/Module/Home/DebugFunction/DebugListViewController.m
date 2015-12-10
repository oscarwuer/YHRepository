//
//  DebugListViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "DebugListViewController.h"
#import "YHCellCatalog.h"
#import "YHSectionCellObject.h"

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
    
    [self configDatasources];
}

- (void)configDatasources
{
    [self resetActions];
    
    NSMutableArray *cellObjects = [NSMutableArray array];
    
    YHSectionCellObject *sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                                                   backgroundColor:[UIColor lightGrayColor]
                                              ];
    [cellObjects addObject:sectionCellObject];
    
//    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"one"];
//    [cellObjects addObject:cellObject];
//    
//    sectionCellObject = [YHSectionCellObject objectWithHeight:20
//                                              backgroundColor:[UIColor lightGrayColor]
//                         ];
//    [cellObjects addObject:sectionCellObject];
//    
//    cellObject = [YHTitleCellObject objectWithTitle:@"two"];
//    [cellObjects addObject:cellObject];
//    
//    sectionCellObject = [YHSectionCellObject objectWithHeight:20
//                                              backgroundColor:[UIColor lightGrayColor]
//                         ];
//    [cellObjects addObject:sectionCellObject];
//    
//    cellObject = [YHTitleCellObject objectWithTitle:@"three"];
//    cellObject.isHiddenSeparateLine = YES;
//    [cellObjects addObject:cellObject];
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithListArray:cellObjects delegate:self];
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
