//
//  YHCollectionFlowLayoutVC.m
//  Oscar
//
//  Created by 张长弓 on 2018/1/4.
//  Copyright © 2018年 yahui.zhang. All rights reserved.
//

#import "YHCollectionFlowLayoutVC.h"
#import "YHCollectionViewCell.h"
#import "YHCollectionFlowLayout.h"

#import "YHFlowLayoutHttpModel.h"

#import "YHFlowLayoutModel.h"

@interface YHCollectionFlowLayoutVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) NSMutableArray *dataSourcesArray;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) YHCollectionFlowLayout *layout;

@property (nonatomic, strong) YHFlowLayoutHttpModel *httpModel;

@end

@implementation YHCollectionFlowLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FlowLayoutVC";
    
    [self.view addSubview:self.collectionView];
    
    /// 初始化请求类
    self.httpModel = [YHFlowLayoutHttpModel manager];
    [self requestForMainData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

#pragma mark Pravite methods


#pragma mark - Request

- (void)requestForMainData {
    [self.httpModel getRequestForCollectionFlowLayoutMainData:kURL_Qinniu_flowLayout completion:^(YHHttpResponse *response, NSArray *listData) {
        if (listData.count > 0) {
            self.dataSourcesArray = [NSMutableArray arrayWithArray:listData];
            
            [self.layout setContentSize:self.dataSourcesArray.count];
            [self.collectionView reloadData];
        } else {
            NSLog(@"YHCollectionFlowLayout page 主数据请求失败！");
        }
    }];
}

#pragma mark - Delegates

#pragma mark UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每个section中得items个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourcesArray.count +1 ;
}

// cell
- (YHCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass([YHCollectionViewCell class]);
    YHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.tag = indexPath.row;
    [cell setIndex:(indexPath.row)];
    
    if(indexPath.row == 0){
        cell.imageView.image = nil;
    }else{
        if(indexPath.row == 1){
            [cell revisePositionAtFirstCell];
        }
        
        YHFlowLayoutModel *model = [self.dataSourcesArray objectAtIndex:indexPath.row - 1];
        
        cell.titleLabel.text = model.film_name;
        cell.descLabel.text = model.film_type;
        cell.bottomLabel.text = model.film_desc;
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:kString_Protect(model.poster_img)] placeholderImage:nil];
    }
    return cell;
}

// 每个item的frame.size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        return CGSizeMake(MIN(kScreenHeight, kScreenWidth), HEADER_HEIGHT);
    }else if(indexPath.row == 1){
        return CGSizeMake(MIN(kScreenHeight, kScreenWidth), CELL_CURRHEIGHT);
    }else{
        return CGSizeMake(MIN(kScreenHeight, kScreenWidth), CELL_HEIGHT);
    }
}

// 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat offset = ceil(DRAG_INTERVAL * (indexPath.row-1));
    if (ceil(collectionView.contentOffset.y) != offset) {
        // 滑动动最顶部
        self.layout.currentCount = indexPath.row;
        [collectionView setContentOffset:CGPointMake(0, offset) animated:YES];
    } else {
        // 点击事件
        NSLog(@"点击了第N%@个",@(indexPath.row));
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    self.layout.currentCount = 1;
}

#pragma mark - Init Views

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // layout
        YHCollectionFlowLayout *layout = [[YHCollectionFlowLayout alloc] init];
        self.layout = layout;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
        NSString *string = NSStringFromClass([YHCollectionViewCell class]);
        [_collectionView registerClass:[YHCollectionViewCell class] forCellWithReuseIdentifier:string];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = kColorFromRGB(0x161518);
        
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}

@end
