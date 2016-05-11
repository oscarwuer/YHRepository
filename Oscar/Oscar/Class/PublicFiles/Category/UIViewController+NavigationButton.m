//
//  UIViewController+NavigationButton.m
//  Oscar
//
//  Created by yahui.zhang on 16/2/23.
//  Copyright © 2016年 yahui.zhang. All rights reserved.
//

#import "UIViewController+NavigationButton.h"
#import "UIImage+Color.h"

@implementation UIViewController (NavigationButton)

- (void)setupNavigationStyle{
    UIColor *imageColor = [UIColor colorFromHexString:@"#0292b5"];
    UIImage *colorImage = [UIImage imageWithColor:imageColor];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:
                               [UIColor whiteColor], NSForegroundColorAttributeName,
                               [UIColor clearColor], NSForegroundColorAttributeName,
                               [UIFont systemFontOfSize:20], NSFontAttributeName,
                               nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attribute];
}


- (void)setLeftButtonWithItem:(id)item
                       target:(id)target
                     selector:(SEL)selector{
    if (item == nil) {
        //TODO: 请传入item
        return;
    }
    /// 传入的是图片
    else if ([item isKindOfClass:[UIImage class]]) {
        UIImage *image = item;
        UIEdgeInsets insets = UIEdgeInsetsMake(0, -35, 0, 0);
        [self.navigationItem setLeftBarButtonItem:[self backBarButtonItemWithImage:image
                                                                            target:target
                                                                          selector:selector
                                                                        edgeInsets:insets]];
    }
    /// 传入的是字符串
    else if ([item isKindOfClass:[NSString class]]){
        //TODO: 待实现
    }
}

- (void)setRightButtonWithItem:(id)item
                        target:(id)target
                      selector:(SEL)selector{
    if (item == nil) {
        //TODO: 请传入item
        return;
    }
    /// 传入的是图片
    else if ([item isKindOfClass:[UIImage class]]) {
        UIImage *image = item;
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 35, 0, 0);
        [self.navigationItem setRightBarButtonItem:[self backBarButtonItemWithImage:image
                                                                             target:target
                                                                           selector:selector
                                                                         edgeInsets:insets]];
    }
    /// 传入的是字符串
    else if ([item isKindOfClass:[NSString class]]){
        NSString *title = item;
        UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithTitle:title
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:target
                                                                     action:selector];
        [self.navigationItem setRightBarButtonItem:titleItem];
    }
}

#pragma mark - common method
- (UIBarButtonItem *)backBarButtonItemWithImage:(UIImage *)image
                                         target:(id)target
                                       selector:(SEL)selector
                                     edgeInsets:(UIEdgeInsets)insets{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateHighlighted];
    [backButton setImageEdgeInsets:insets];
    [backButton setTitle:@"  " forState:UIControlStateNormal];
    [backButton setTitle:@"  " forState:UIControlStateHighlighted];
    [backButton setBackgroundColor:[UIColor clearColor]];
    [backButton addTarget:target action:selector
         forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

@end
