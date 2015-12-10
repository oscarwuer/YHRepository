//
//  YHBaseViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHBaseViewController.h"

@interface YHBaseViewController ()

@end

@implementation YHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!kIsIOS7Lower)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}


@end
