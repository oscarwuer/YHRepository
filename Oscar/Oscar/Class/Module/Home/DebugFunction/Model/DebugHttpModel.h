//
//  DebugHttpSessionManager.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/11.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHHttpSessionManager.h"

@interface DebugHttpModel : YHHttpSessionManager

+ (instancetype)manager;

- (void)test_getRequest:(NSString *)getUrl
             completion:(YHHttpCompletionHandler)completion;

@end
