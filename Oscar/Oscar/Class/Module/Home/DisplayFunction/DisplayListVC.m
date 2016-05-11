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

#import "YHSectionCellObject.h"

#import "DisplayHttpModel.h"

@interface DisplayListVC ()

@property (nonatomic, strong) DisplayHttpModel *httpModel;

@end

@implementation DisplayListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    self.title = @"Function List";
    
    /// 加载数据源
    [self configDatasources];
    
    /// 初始化请求类
    self.httpModel = [DisplayHttpModel manager];
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
    
    /// 打印HTTP请求
    [cellObjects addObject:[self getLogHttpResquestCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    /// Nimbu Section Page
    [cellObjects addObject:[self getNimbusSectionPageCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    /// SVPullToRefresh
    [cellObjects addObject:[self getSVPullToRfreshCellObject]];
    [cellObjects addObject:[self getSectionCellObject]];
    
    /// LoopScrollVC
    [cellObjects addObject:[self getLoopScrollViewCellObject]];
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

/// 打印HTTP请求
- (YHTitleCellObject *)getLogHttpResquestCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"1. 打印Http请求"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(oneClick:)];
    return cellObject;
}

/// Nimbu Section Page
- (YHTitleCellObject *)getNimbusSectionPageCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"2. Nimbus Section Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(twoClick:)];
    return cellObject;
}

/// SVPullToRefresh
- (YHTitleCellObject *)getSVPullToRfreshCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"3. SVPullToRefresh Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(threeClick:)];
    return cellObject;
}

/// LoopScrollVC
- (YHTitleCellObject *)getLoopScrollViewCellObject {
    YHTitleCellObject *cellObject = [YHTitleCellObject objectWithTitle:@"4. YHLoopScrollView Page"];
    cellObject.isHiddenSeparateLine = YES;
    [self.actions attachToObject:cellObject navigationSelector:@selector(fourClick:)];
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
- (void)oneClick:(id)sender {
    [self.httpModel test_getRequest:kURL_Qiniu_hots
                         completion:^(YHHttpResponse *response) {
                             NSLog(@"%@",response.responseDic);
                         }];
}

- (void)twoClick:(id)sender {
    NimbusSectionVC *vc = [[NimbusSectionVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)threeClick:(id)sender {
    SVPullRefreshVC *vc = [[SVPullRefreshVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)fourClick:(id)sender {
    DisplayLoopScrollVC *vc = [[DisplayLoopScrollVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
