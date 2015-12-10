//
//  YHHomeViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHHomeViewController.h"
#import "DebugListViewController.h"

@interface YHHomeViewController ()<RDVTabBarControllerDelegate>

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
    [self setupViewControllers];
    [self setupTabbar];
    
}

- (void)initialize
{
    self.delegate = self;
    /// adjust tabbar height
    [self.tabBar setFrame:CGRectMake(self.tabBar.left, self.tabBar.top, self.tabBar.width, kTabbarHeight)];
}

/// initialize viewControllers
- (void)setupViewControllers
{
    DebugListViewController *vc1 = [[DebugListViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    DebugListViewController *vc2 = [[DebugListViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    self.viewControllers = @[nav1,nav2];
    
}

/// initialize tabbarItems
- (void)setupTabbar
{
    /// tabbar titles
    NSArray *itemTitles = @[@"one",@"two"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        item.title = itemTitles[index];
        index ++;
    }
}

#pragma mark - RDVTabBarControllerDelegateX
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%@",viewController);
}

@end
