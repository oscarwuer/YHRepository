//
//  DisplayLoopScrollVC.m
//  Oscar
//
//  Created by yahui.zhang on 5/11/16.
//  Copyright © 2016 yahui.zhang. All rights reserved.
//

#import "DisplayLoopScrollVC.h"
#import "YHLoopScrollView.h"


@interface DisplayLoopScrollVC ()<YHLoopScrollViewDelegate>

@property (nonatomic, strong) YHLoopScrollView *loopScrollView;

@end

@implementation DisplayLoopScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YHLoopScrollView";
    self.view.backgroundColor = [UIColor colorFromHexString:@"#d8d8d8"];
    
    CGRect frame = CGRectMake(0, 20, self.view.frame.size.width, 120);
    self.loopScrollView = [[YHLoopScrollView alloc] initWithLoopPageType:LoopPageType_Circle delegate:self frame:frame];
    NSArray *imgUrls = @[@"http://img14.gomein.net.cn/image/prodimg/promimg/topics/201511/20151102/1733jjj640_x.jpg",
                         
                         @"http://img4.gomein.net.cn/image/prodimg/promimg/topics/201510/20151030/1733kaimen280_x.jpg",
                         
                         @"http://img10.gomein.net.cn/image/prodimg/promimg/topics/201510/20151030/1733bx280_x.jpg",
                         
                         @"http://img3.gomein.net.cn/image/prodimg/promimg/topics/201510/20151030/1733qu280_x.jpg",
                         
                         @"http://img10.gomein.net.cn/image/prodimg/promimg/topics/201511/20151102/1733dn280_x.jpg",
                         
                         @"http://img1.gomein.net.cn/image/prodimg/promimg/topics/201510/20151030/1733cd280_x.jpg",
                         
                         @"http://img13.gomein.net.cn/image/prodimg/promimg/topics/201510/20151030/1733bh280_x.jpg"];
    
    self.loopScrollView.mArrayImageUrls = [imgUrls mutableCopy];
    [self.view addSubview:self.loopScrollView];
}

#pragma mark - YHLoopScrollViewDelegate

- (void)requiredLoopScrollView:(YHLoopScrollView *)aScrollViewLoop
              didSelectedIndex:(NSUInteger)aUIntIndex
{
    /// 处理点击之后的跳转逻辑
    NSLog(@"轮播图点击的是第%@个",@(aUIntIndex+1));
}

@end
