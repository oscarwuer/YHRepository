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
#import "DebugHttpModel.h"

@interface DebugListViewController ()

@property (nonatomic, strong) DebugHttpModel *httpModel;

@end

@implementation DebugListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    
    /// 开启下拉功能
    [self setShowsPullToRefresh:YES];
    [self triggerPullToRefresh];
    
    /// 开启上拉加载功能
    [self setShowsInfiniteScrolling:YES];
    
    [self configDatasources];
    
    self.httpModel = [DebugHttpModel manager];
}

- (void)configDatasources
{
    [self resetActions];
    
    NSMutableArray *cellObjects = [NSMutableArray array];
    
    /// section背景颜色
    UIColor *sectionBackgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    
    YHSectionCellObject *sectionCellObject = nil;
    sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                              backgroundColor:sectionBackgroundColor
                                              ];
    [cellObjects addObject:sectionCellObject];
    
    /// one
    YHTitleCellObject *cellObject = nil;
    cellObject = [YHTitleCellObject objectWithTitle:@"one"];
    cellObject.isHiddenSeparateLine = YES;
    [cellObjects addObject:cellObject];
    [self.actions attachToObject:cellObject navigationSelector:@selector(oneClick:)];
    
    
    sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                              backgroundColor:sectionBackgroundColor
                         ];
    [cellObjects addObject:sectionCellObject];
    
    
    /// two
    cellObject = [YHTitleCellObject objectWithTitle:@"two"];
    cellObject.isHiddenSeparateLine = YES;
    [cellObjects addObject:cellObject];
    
    sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                              backgroundColor:sectionBackgroundColor
                         ];
    [cellObjects addObject:sectionCellObject];
    [self.actions attachToObject:cellObject navigationSelector:@selector(oneClick:)];
    
    /// three
    cellObject = [YHTitleCellObject objectWithTitle:@"three"];
    cellObject.isHiddenSeparateLine = YES;
    [cellObjects addObject:cellObject];
    [self.actions attachToObject:cellObject navigationSelector:@selector(oneClick:)];
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithListArray:cellObjects delegate:self];
    [self.tableView reloadData];
}


#pragma mark - click event
- (void)oneClick:(id)sender
{
    NSLog(@"%@",sender);
    [self.httpModel test_getRequest:kURL_Qiniu_hots
                         completion:^(YHHttpResponse *response) {
                             NSLog(@"%@",response.responseDic);
                             
                         }];
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
