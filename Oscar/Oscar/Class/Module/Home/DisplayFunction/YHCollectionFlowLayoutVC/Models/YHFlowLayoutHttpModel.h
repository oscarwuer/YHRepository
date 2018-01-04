//
//  YHFlowLayoutHttpModel.h
//  Oscar
//
//  Created by 张长弓 on 2018/1/4.
//  Copyright © 2018年 yahui.zhang. All rights reserved.
//

#import "YHHttpSessionManager.h"

@interface YHFlowLayoutHttpModel : YHHttpSessionManager

+ (instancetype)manager;

// YHCollectionFlowLayout 主数据请求
- (void)getRequestForCollectionFlowLayoutMainData:(NSString *)getUrl completion:(void (^)(YHHttpResponse *response, NSArray *listData))completion;

@end
