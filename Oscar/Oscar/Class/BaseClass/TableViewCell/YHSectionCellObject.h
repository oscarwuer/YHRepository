//
//  YHSectionCellObject.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHCellCatalog.h"

@interface YHSectionCellObject : YHTitleCellObject

/*!
 *  @author yahui.zhang, 15-12-10 18:12:29
 *
 *  @brief 初始化 sectionCellObject,默认不显示分割线
 *
 *  @param cellHeight      cell的高度
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例对象
 *
 *  @since 1.0.1
 */
+ (YHSectionCellObject *)objectWithHeight:(CGFloat)cellHeight
                              backgroundColor:(UIColor *)backgroundColor;

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) UIColor *backgroundColor;

@end

@interface YHSectionCell : YHTextCell

@end
