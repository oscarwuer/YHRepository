//
//  YHSectionCellObject.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHSectionCellObject.h"

@implementation YHSectionCellObject

+ (YHSectionCellObject *)objectWithHeight:(CGFloat)cellHeight
                              backgroundColor:(UIColor *)backgroundColor
{
    YHSectionCellObject *cellObject = [YHSectionCellObject objectWithTitle:nil];
    cellObject.cellHeight = cellHeight;
    cellObject.backgroundColor = backgroundColor;
    cellObject.isHiddenSeparateLine = YES;
    return cellObject;
}

-(Class)cellClass
{
    return [YHSectionCell class];
}

@end

@implementation YHSectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    return self;
}

- (BOOL)shouldUpdateCellWithObject:(YHSectionCellObject *)object
{
    [super shouldUpdateCellWithObject:object];
    self.contentView.backgroundColor = object.backgroundColor;
    return YES;
}

+(CGFloat)heightForObject:(YHSectionCellObject *)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    return object.cellHeight;
}

@end
