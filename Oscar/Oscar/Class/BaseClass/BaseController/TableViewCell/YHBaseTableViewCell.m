//
//  YHBaseTableViewCell.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHBaseTableViewCell.h"

@implementation YHBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0f green:arc4random()%255/256.0f blue:arc4random()%255/256.0f alpha:1.0f];
}

@end
