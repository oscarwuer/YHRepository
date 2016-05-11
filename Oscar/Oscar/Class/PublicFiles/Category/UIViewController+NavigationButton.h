//
//  UIViewController+NavigationButton.h
//  Oscar
//
//  Created by yahui.zhang on 16/2/23.
//  Copyright © 2016年 yahui.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationButton)

/// 设置navigationBar的颜色和title的颜色
- (void)setupNavigationStyle;

/// 设置导航栏左边button
- (void)setLeftButtonWithItem:(id)item
                       target:(id)target
                     selector:(SEL)selector;

/// 设置导航栏右边button
- (void)setRightButtonWithItem:(id)item
                        target:(id)target
                      selector:(SEL)selector;

@end
