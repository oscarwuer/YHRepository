//
//  DebugHttpSessionManager.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/11.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "DebugHttpModel.h"

@interface DebugHttpModel ()

@property (nonatomic, strong) YHHttpSessionManager *sessionManager;


@end

@implementation DebugHttpModel

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


- (void)test_getRequest:(NSString *)getUrl
             completion:(YHHttpCompletionHandler)completion
{
    [self.sessionManager GET:getUrl parameters:nil complete:completion];
}

@end
