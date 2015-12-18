//
//  YHBaseTableViewCell.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/10.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHCellCatalog.h"

@implementation YHSubtitleCellObject

- (instancetype)copyWithZone:(NSZone *)zone{
    YHSubtitleCellObject *object = [[[self class] allocWithZone:zone] init];
    object.subtitle = self.subtitle;
    object.cellStyle = self.cellStyle;
    object.title = self.title;
    object.image = self.image;
    object.userInfo = self.userInfo;
    object.lineEdgeInsets = object.lineEdgeInsets;
    object.isHiddenSeparateLine = object.isHiddenSeparateLine;
    return object;
}

- (Class)cellClass {
    return [YHTextCell class];
}

@end

@implementation YHTitleCellObject

- (instancetype)copyWithZone:(NSZone *)zone{
    YHTitleCellObject *object = [[[self class] allocWithZone:zone] init];
    object.title = self.title;
    object.image = self.image;
    object.userInfo = self.userInfo;
    object.lineEdgeInsets = object.lineEdgeInsets;
    object.isHiddenSeparateLine = object.isHiddenSeparateLine;
    return object;
}

- (Class)cellClass {
    return [YHTextCell class];
}

@end

@interface YHTextCell ()

@property (nonatomic, assign) UIEdgeInsets lineEdgeInsets;

@property (nonatomic, strong) UIImageView *separateLineView;

@end

@implementation YHTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.separateLineView = [[UIImageView alloc] init];
        self.separateLineView.backgroundColor = [UIColor blackColor];
        self.separateLineView.alpha = 0.3f;
        [self addSubview:self.separateLineView];
        [self.separateLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.mas_leading).offset(10);
            make.trailing.equalTo(self.mas_trailing).offset(0);
            make.bottom.equalTo(self.mas_bottom);
            make.height.equalTo(@(1));
        }];
    }
    return self;
}

- (BOOL)shouldUpdateCellWithObject:(id)object{
    [super shouldUpdateCellWithObject:object];
    self.cellObject = object;
    
    if ([object isKindOfClass:[YHTitleCellObject class]]) {
        YHTitleCellObject* titleObject = object;
        self.lineEdgeInsets = titleObject.lineEdgeInsets;
        self.separateLineView.hidden = titleObject.isHiddenSeparateLine;
    }
    
    if ([object isKindOfClass:[YHSubtitleCellObject class]]) {
        YHSubtitleCellObject* subtitleObject = object;
        self.detailTextLabel.text = subtitleObject.subtitle;
        self.lineEdgeInsets = subtitleObject.lineEdgeInsets;
        self.separateLineView.hidden = subtitleObject.isHiddenSeparateLine;
    }
    
    return YES;
}

-(void)setLineEdgeInsets:(UIEdgeInsets)lineEdgeInsets
{
    CGFloat left = lineEdgeInsets.left;
    CGFloat right = lineEdgeInsets.right;
    CGFloat bottom = lineEdgeInsets.bottom;
    if (left)
    {
        [self.separateLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.mas_leading).offset(left);
        }];
    }
    if (right)
    {
        [self.separateLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.mas_trailing).offset(right);
        }];
    }
    if (bottom)
    {
        [self.separateLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(bottom);
        }];
    }
}

@end
