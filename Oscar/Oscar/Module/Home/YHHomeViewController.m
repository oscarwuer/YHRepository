//
//  YHHomeViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHHomeViewController.h"

@interface YHHomeViewController ()

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControllers];
    [self setupTabbar];
    
}

/// initialize viewControllers
- (void)setupViewControllers
{
    YHBaseTableViewController *vc1 = [[YHBaseTableViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    self.viewControllers = @[nav1];
    
}

/// initialize tabbar
- (void)setupTabbar
{
    
}

@end
