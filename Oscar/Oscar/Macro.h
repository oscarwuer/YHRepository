//
//  Macro.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/// 屏幕物理宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

/// iOS版本判断
#define kIsIOS8Lower ([[[UIDevice currentDevice] systemVersion] floatValue]<8.0) // iOS8以下
#define kIsIOS7Lower ([[[UIDevice currentDevice] systemVersion] floatValue]<7.0) // iOS7以下

/// tabbar height
#define kTabbarHeight 49

#endif /* Macro_h */
