//
//  DebugSectionViewController.m
//  Oscar
//
//  Created by yahui.zhang on 16/1/29.
//  Copyright © 2016年 yahui.zhang. All rights reserved.
//

#import "DebugSectionViewController.h"
#import "YHCellCatalog.h"

@interface DebugSectionViewController ()

@end

@implementation DebugSectionViewController

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
    }
    
    self.dataSource = [[NIMutableTableViewModel alloc] initWithSectionedArray:cellObjects delegate:self];
    [self.tableView reloadData];
}

@end
