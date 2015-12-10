//
//  YHBaseNimbusTableViewController.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHBTableViewController.h"

@interface YHBNimbusTableViewController : YHBTableViewController<NIMutableTableViewModelDelegate>

/// tableView的数据源.
@property (strong, nonatomic) NIMutableTableViewModel *dataSource;

/// 用于cell点击, tableView的delegate事件传递等操作.
@property (strong, nonatomic, readonly) NITableViewActions *actions;

/// 重置actions,目的为了消除缓存.
- (void)resetActions;


@end
