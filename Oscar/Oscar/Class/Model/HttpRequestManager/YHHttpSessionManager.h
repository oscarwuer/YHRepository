//
//  YHHttpSessionManager.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/11.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHHttpResponse.h"

@interface YHHttpSessionManager : NSObject

typedef void(^YHHttpCompletionHandler)(YHHttpResponse *response);

+ (YHHttpSessionManager *)manager;

/// get请求
- (void)GET:(NSString *)URLString
 parameters:(id)parameters
   complete:(YHHttpCompletionHandler)complete;

/// post请求
- (void)POST:(NSString *)URLString
  parameters:(id)parameters
    complete:(YHHttpCompletionHandler)complete;

/// put请求
- (void)PUT:(NSString *)URLString
 parameters:(id)parameters
   complete:(YHHttpCompletionHandler)complete;

/// delete请求
- (void)DELETE:(NSString *)URLString
    parameters:(id)parameters
      complete:(YHHttpCompletionHandler)complete;

@end
