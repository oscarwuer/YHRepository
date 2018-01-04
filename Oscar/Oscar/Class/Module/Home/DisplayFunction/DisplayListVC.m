//
//  DebugListViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "DisplayListVC.h"

#import "NimbusSectionVC.h"
#import "SVPullRefreshVC.h"
#import "DisplayLoopScrollVC.h"
#import "YHCollectionFlowLayoutVC.h"

#import "YHSectionCellObject.h"

@interface DisplayListVC ()

@end

@implementation DisplayListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    self.title = @"Function List";
    
    /// 加载数据源
    [self configDatasources];
}

- (void)configDatasources
{
    [self resetActions];
    
    NSMutableArray *cellObjects = [NSMutableArray array];
    
    YHSectionCellObject *sectionCellObject = nil;
    sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                              backgroundColor:[self sectionBackgroundColor]
                                              ];
    [cellObjects addObject:sectionCellObject];
    
    /// Nimbu Section Page
    [cellObjects addObject:[self getNimbusSectionPageCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    /// SVPullToRefresh
    [cellObjects addObject:[self getSVPullToRfreshCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    /// LoopScrollVC
    [cellObjects addObject:[self getLoopScrollViewCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    // CollectionFlowLayout
    [cellObjects addObject:[self getYHCollectionFlowLayoutVCCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithListArray:cellObjects delegate:self];
    [self.tableView reloadData];
}

#pragma mark - utils

/// section背景颜色
- (UIColor *)sectionBackgroundColor {
    UIColor *sectionBackgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    return sectionBackgroundColor;
}

#pragma mark - cell list

/// Nimbu Section Page
- (YHTitleCellObject *)getNimbusSectionPageCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"1. Nimbus Section Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(nimbusSectionClick:)];
    return cellObject;
}

/// SVPullToRefresh
- (YHTitleCellObject *)getSVPullToRfreshCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"2. SVPullToRefresh Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(svPullToRefreshClick:)];
    return cellObject;
}

/// LoopScrollVC
- (YHTitleCellObject *)getLoopScrollViewCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"3. YHLoopScrollView Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(loopScrollVCClick:)];
    return cellObject;
}

// YHCollectionFlowLayoutVC
- (YHTitleCellObject *)getYHCollectionFlowLayoutVCCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"4. YHCollectionFlowLayoutVC Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(flowLayoutVCClick:)];
    return cellObject;
}

/// sectionCellObject
- (YHSectionCellObject *)getSectionCellObject {
    YHSectionCellObject *sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                                                   backgroundColor:[self sectionBackgroundColor]
                                              ];
    return sectionCellObject;
}

#pragma mark - click event

- (void)nimbusSectionClick:(id)sender {
    NimbusSectionVC *vc = [[NimbusSectionVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)svPullToRefreshClick:(id)sender {
    SVPullRefreshVC *vc = [[SVPullRefreshVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loopScrollVCClick:(id)sender {
    DisplayLoopScrollVC *vc = [[DisplayLoopScrollVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)flowLayoutVCClick:(id)sender {
    YHCollectionFlowLayoutVC *vc = [[YHCollectionFlowLayoutVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
