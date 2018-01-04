//
//  YHFlowLayoutHttpModel.m
//  Oscar
//
//  Created by 张长弓 on 2018/1/4.
//  Copyright © 2018年 yahui.zhang. All rights reserved.
//

#import "YHFlowLayoutHttpModel.h"
#import "YHFlowLayoutModel.h"

@interface YHFlowLayoutHttpModel ()

@property (nonatomic, strong) YHHttpSessionManager *sessionManager;

@end

@implementation YHFlowLayoutHttpModel

-(instancetype)init{
    self = [super init];
    if (self) {
        self.sessionManager = [[YHHttpSessionManager alloc] init];
    }
    return self;
}

+ (instancetype)manager{
    return [[self alloc] init];
}


- (void)getRequestForCollectionFlowLayoutMainData:(NSString *)getUrl completion:(void (^)(YHHttpResponse *response, NSArray *listData))completion {
    [self.sessionManager GET:getUrl parameters:nil complete:^(YHHttpResponse *response) {
        NSArray *dataArray = response.responseDic[@"data"];
        
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:dataArray.count];
        for (NSDictionary *dic in dataArray) {
            YHFlowLayoutModel *model = [[YHFlowLayoutModel alloc] initWithDictionary:dic error:nil];
            [mArray addObject:model];
        }
        
        if (completion) {
            completion(response, mArray.copy);
        }
    }];
}

@end
