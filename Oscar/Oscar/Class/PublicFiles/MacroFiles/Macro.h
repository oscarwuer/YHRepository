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
#define kIsIOS9Lower ([[[UIDevice currentDevice] systemVersion] floatValue]<9.0) // iOS9以下
#define kIsIOS8Lower ([[[UIDevice currentDevice] systemVersion] floatValue]<8.0) // iOS8以下
#define kIsIOS7Lower ([[[UIDevice currentDevice] systemVersion] floatValue]<7.0) // iOS7以下

/// tabbar height
#define kTabbarHeight 49

#pragma mark - 保护
#define kObject_Is_Class(obj, className) ([obj isKindOfClass:[className class]])

/// 是否NSArray类型（单独处理NSMutableArray）
#define kArray_Is_Class(array) kObject_Is_Class(array, NSArray)
#define kmArray_Is_Class(mArray) kObject_Is_Class(mArray, NSMutableArray)

/// 是否有效，不为空，且是NSArray类型，且count值大于0（单独处理NSMutableArray）
#define kArray_Is_Valid(array) ((kArray_Is_Class(array)) && ([array count] > 0))
#define kmArray_Is_Valid(mArray) ((mArray) && (kmArray_Is_Class(mArray)) && ([mArray count] > 0))


/// 是否为NSString类型（单独处理NSMutableString）
#define kString_Is_Class(string) kObject_Is_Class(string, NSString)
#define kmString_Is_Class(mString) kObject_Is_Class(mstr, NSMutableString)

/// 是否有效，不为空，且是NSString类型，且count值大于0（单独处理NSMutableString）
#define kString_Is_Valid(string) ((string) && (kString_Is_Class(string)) && ([string length] > 0))
#define kmString_Is_Valid(mstr) ((mstr) && (kmString_Is_Class(mstr)) && ([mstr length] > 0))

/// nil保护，当为nil时，返回@""，避免一些Crash
#define kString_Protect(string) ((string) ? (string) : (@""))


#endif /* Macro_h */
