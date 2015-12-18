//
//  YHBaseTableViewCell.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHSubtitleCellObject : NISubtitleCellObject <NSCopying>

/// 分割线edgeInsets 默认是 UIEdgeInsetsMake(0, 10, 0, -10)，注意！！！ top设置无效果
@property (nonatomic, assign) UIEdgeInsets lineEdgeInsets;

/// 是否显示分割线 default is NO(显示)
@property (nonatomic, assign) BOOL isHiddenSeparateLine;

@end

@interface YHTitleCellObject : NITitleCellObject <NSCopying>

/// 分割线edgeInsets 默认是 UIEdgeInsetsMake(0, 10, 0, -10)，注意！！！ top设置无效果
@property (nonatomic, assign) UIEdgeInsets lineEdgeInsets;

/// 是否显示分割线 default is YES(显示)
@property (nonatomic, assign) BOOL isHiddenSeparateLine;

@end

@interface YHTextCell : NITextCell

@property (nonatomic, assign) id cellObject;

@end
