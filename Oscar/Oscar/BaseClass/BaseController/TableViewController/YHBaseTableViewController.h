//
//  YHBaseTableViewController.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHBaseViewController.h"
#import <SVPullToRefresh.h>

@interface YHBaseTableViewController : YHBaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;



@end
