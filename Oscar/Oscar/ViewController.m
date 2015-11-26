//
//  ViewController.m
//  Oscar
//
//  Created by yahui.zhang on 15/11/19.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *oneView = [UIView new];
    oneView.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0f green:arc4random()%255/256.0f blue:arc4random()%255/256.0f alpha:1.0f];
    [self.view addSubview:oneView];
    
    [oneView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    UIView *twoView = [UIView new];
    twoView.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0f green:arc4random()%255/256.0f blue:arc4random()%255/256.0f alpha:1.0f];
    [oneView addSubview:twoView];
    
    [twoView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(oneView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
}

@end
