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
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0f green:arc4random()%255/256.0f blue:arc4random()%255/256.0f alpha:1.0f];
}

@end
