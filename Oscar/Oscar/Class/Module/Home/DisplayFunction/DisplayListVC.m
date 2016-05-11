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

#import "YHCellCatalog.h"
#import "YHSectionCellObject.h"
#import "DisplayHttpModel.h"

@interface DisplayListVC ()

@property (nonatomic, strong) DisplayHttpModel *httpModel;

@end

@implementation DisplayListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    self.title = @"Debug List";
    
    /// 加载数据源
    [self configDatasources];
    
    /// 初始化请求类
    self.httpModel = [DisplayHttpModel manager];
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
    cellObject = [YHTitleCellObject objectWithTitle:@"1. 打印Http请求"];
    cellObject.isHiddenSeparateLine = YES;
    [cellObjects addObject:cellObject];
    [self.actions attachToObject:cellObject navigationSelector:@selector(oneClick:)];
    
    
    sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                              backgroundColor:sectionBackgroundColor
                         ];
    [cellObjects addObject:sectionCellObject];
    
    
    /// two
    cellObject = [YHTitleCellObject objectWithTitle:@"2. Nimbus Section Page"];
    cellObject.isHiddenSeparateLine = YES;
    [cellObjects addObject:cellObject];
    
    sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                              backgroundColor:sectionBackgroundColor
                         ];
    [cellObjects addObject:sectionCellObject];
    [self.actions attachToObject:cellObject navigationSelector:@selector(twoClick:)];
    
    /// three
    cellObject = [YHTitleCellObject objectWithTitle:@"3. SVPullToRefresh Page"];
    cellObject.isHiddenSeparateLine = YES;
    [cellObjects addObject:cellObject];
    [self.actions attachToObject:cellObject navigationSelector:@selector(threeClick:)];
    
    /// test
    for (NSInteger i = 0; i < 20; i++) {
        sectionCellObject = [YHSectionCellObject objectWithHeight:20
                                                  backgroundColor:sectionBackgroundColor
                             ];
        [cellObjects addObject:sectionCellObject];
        cellObject = [YHTitleCellObject objectWithTitle:[NSString stringWithFormat:@"Just Test %@",@(i)]];
        cellObject.isHiddenSeparateLine = YES;
        [cellObjects addObject:cellObject];
    }
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithListArray:cellObjects delegate:self];
    [self.tableView reloadData];
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

@end
