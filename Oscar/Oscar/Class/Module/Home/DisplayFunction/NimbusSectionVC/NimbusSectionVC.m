//
//  DebugSectionViewController.m
//  Oscar
//
//  Created by yahui.zhang on 16/1/29.
//  Copyright © 2016年 yahui.zhang. All rights reserved.
//

#import "NimbusSectionVC.h"
#import "YHCellCatalog.h"

@interface NimbusSectionVC ()

@end

@implementation NimbusSectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"tableView section";
    
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
        if (i == 4) {
            cellObject.isHiddenSeparateLine = YES;
            [cellObjects addObject:@"second action"];
        }
    }
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithSectionedArray:cellObjects delegate:self];
    [self.tableView reloadData];
}

#pragma mark - 
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    if (section == 0)
    {
        view.backgroundColor = [UIColor redColor];
        /// custome first section header
    }
    else
    {
        view.backgroundColor = [UIColor greenColor];
        /// custome second section header
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0)
    {
        return 50;
    }
    else
    {
        return 88;
    }
    return 44;
}

@end
