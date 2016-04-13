//
//  AppDelegate.m
//  Oscar
//
//  Created by yahui.zhang on 15/11/19.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "YHHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self showHomeViewController];
    
    return YES;
}

- (void)showHomeViewController {
    YHHomeViewController *homeVC = [[YHHomeViewController alloc] init];
    self.window.rootViewController = homeVC;
}

@end
