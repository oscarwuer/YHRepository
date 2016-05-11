//
//  YHHttpSessionManager.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/11.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHHttpSessionManager.h"
#import <AFNetworking.h>

@interface YHHttpSessionManager ()

@property (strong, nonatomic)AFHTTPSessionManager *sessionManager;

@end

@implementation YHHttpSessionManager

#pragma mark - 初始化...
+ (YHHttpSessionManager *)manager
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        self.sessionManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
        [self.sessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        //添加服务器返回数据contentType支持
        NSSet *oldContentTypes = self.sessionManager.responseSerializer.acceptableContentTypes;
        NSMutableSet *contentTypes = [NSMutableSet setWithSet:oldContentTypes];
        [contentTypes addObject:@"text/html"];
        [self.sessionManager.responseSerializer setAcceptableContentTypes:contentTypes];
        
        NSMutableIndexSet *acceptableStatusCodes = [[self.sessionManager.responseSerializer acceptableStatusCodes] mutableCopy];
        [acceptableStatusCodes addIndex:400];
        [self.sessionManager.responseSerializer setAcceptableStatusCodes:[acceptableStatusCodes copy]];
    }
    return self;
}

#pragma mark - 对外接口
/// get请求
- (void)GET:(NSString *)URLString
 parameters:(id)parameters
   complete:(YHHttpCompletionHandler)complete
{
    __weak YHHttpSessionManager *weakSelf = self;
    [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [weakSelf handleResponse:task responseObject:responseObject requestSuccessed:YES error:nil complete:complete];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [weakSelf handleResponse:task responseObject:nil requestSuccessed:NO error:error complete:complete];
    }];
}

/// post请求
- (void)POST:(NSString *)URLString
  parameters:(id)parameters
    complete:(YHHttpCompletionHandler)complete
{
    __weak YHHttpSessionManager *weakSelf = self;
    [self POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [weakSelf handleResponse:task responseObject:responseObject requestSuccessed:YES error:nil complete:complete];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [weakSelf handleResponse:task responseObject:nil requestSuccessed:NO error:error complete:complete];
    }];
}

/// put请求
- (void)PUT:(NSString *)URLString
 parameters:(id)parameters
   complete:(YHHttpCompletionHandler)complete
{
    __weak YHHttpSessionManager *weakSelf = self;
    [self PUT:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [weakSelf handleResponse:task responseObject:responseObject requestSuccessed:YES error:nil complete:complete];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [weakSelf handleResponse:task responseObject:nil requestSuccessed:NO error:error complete:complete];
    }];
}

/// delete请求
- (void)DELETE:(NSString *)URLString
    parameters:(id)parameters
      complete:(YHHttpCompletionHandler)complete
{
    __weak YHHttpSessionManager *weakSelf = self;
    [self DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [weakSelf handleResponse:task responseObject:responseObject requestSuccessed:YES error:nil complete:complete];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [weakSelf handleResponse:task responseObject:nil requestSuccessed:NO error:error complete:complete];
    }];
}

#pragma mark - token相关处理
/// 判断token是否过期(respone.statusCode 是否为401)
- (BOOL)didTokenExpired:(NSURLSessionDataTask *)task{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    NSInteger statusCode = response.statusCode;
    return statusCode == 401;
}

/// 添加token到httpHeader中
- (void)addTokenToHTTPHeader{
    /// 暂且不做处理
}

- (void)updateTokenWithSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    /// 暂且不做处理
}

#pragma mark - get post put delete实际处理
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    __weak YHHttpSessionManager *weakSelf = self;
    NSURLSessionDataTask *dataTask = nil;
    [self addTokenToHTTPHeader];
    dataTask = [weakSelf.sessionManager GET:URLString
                                 parameters:parameters
                                    success:success
                                    failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        BOOL didTokenExpired = [weakSelf didTokenExpired:task];
                                        if (didTokenExpired) {
                                            [weakSelf updateTokenWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
                                                [self addTokenToHTTPHeader];
                                                [weakSelf.sessionManager GET:URLString parameters:parameters success:success failure:failure];
                                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                if (failure) {
                                                    failure(task, error);
                                                }
                                            }];
                                        }else{
                                            if (failure) {
                                                failure(task, error);
                                            }
                                        }
                                    }];
    return dataTask;
}


- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    __weak YHHttpSessionManager *weakSelf = self;
    NSURLSessionDataTask *dataTask = nil;
    [self addTokenToHTTPHeader];
    dataTask = [weakSelf.sessionManager POST:URLString
                                  parameters:parameters
                                     success:success
                                     failure:^(NSURLSessionDataTask *task, NSError *error) {
                                         BOOL didTokenExpired = [weakSelf didTokenExpired:task];
                                         if (didTokenExpired) {
                                             [weakSelf updateTokenWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
                                                 [self addTokenToHTTPHeader];
                                                 [weakSelf.sessionManager POST:URLString parameters:parameters success:success failure:failure];
                                             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                 if (failure) {
                                                     failure(task, error);
                                                 }
                                             }];
                                         }else{
                                             if (failure) {
                                                 failure(task, error);
                                             }
                                         }
                                     }];
    return dataTask;
}

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    __weak YHHttpSessionManager *weakSelf = self;
    [self addTokenToHTTPHeader];
    NSURLSessionDataTask *dataTask = nil;
    dataTask = [weakSelf.sessionManager PUT:URLString
                                 parameters:parameters
                                    success:success
                                    failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        BOOL didTokenExpired = [weakSelf didTokenExpired:task];
                                        if (didTokenExpired) {
                                            [weakSelf updateTokenWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
                                                [self addTokenToHTTPHeader];
                                                [weakSelf.sessionManager PUT:URLString parameters:parameters success:success failure:failure];
                                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                if (failure) {
                                                    failure(task, error);
                                                }
                                            }];
                                        }else{
                                            if (failure) {
                                                failure(task, error);
                                            }
                                        }
                                    }];
    return dataTask;
}

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    __weak YHHttpSessionManager *weakSelf = self;
    [self addTokenToHTTPHeader];
    NSURLSessionDataTask *dataTask = nil;
    dataTask = [weakSelf.sessionManager DELETE:URLString
                                    parameters:parameters
                                       success:success
                                       failure:^(NSURLSessionDataTask *task, NSError *error) {
                                           BOOL didTokenExpired = [weakSelf didTokenExpired:task];
                                           if (didTokenExpired) {
                                               [weakSelf updateTokenWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
                                                   [self addTokenToHTTPHeader];
                                                   [weakSelf.sessionManager DELETE:URLString parameters:parameters success:success failure:failure];
                                               } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                   if (failure) {
                                                       failure(task, error);
                                                   }
                                               }];
                                           }else{
                                               if (failure) {
                                                   failure(task, error);
                                               }
                                           }
                                       }];
    return dataTask;
}



#pragma mark - 请求完成公共处理方法
- (void)handleResponse:(NSURLSessionDataTask *)task
        responseObject:(id)responseObject
      requestSuccessed:(BOOL)succeed
                 error:(NSError *)error
              complete:(YHHttpCompletionHandler)complete{
    
    NSURLRequest *request = task.currentRequest;
    NSString *httpBody = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    NSLog(@"\n客户端请求数据:\n Method:%@ \n URL:%@ \n Header:%@ \n Body:%@\n", request.HTTPMethod, request.URL, request.allHTTPHeaderFields, httpBody);
    NSLog(@"\n服务器返回数据:\n statusCode:%li \n Header:%@\n", (long)response.statusCode, response.allHeaderFields);
    
    if (complete) {
        NSInteger statusCode = response.statusCode;
        if (statusCode == 400) {
            succeed = NO;
            error = [NSError errorWithDomain:@"com.nbchat.badrequest" code:statusCode userInfo:responseObject];
        }
        YHHttpResponse *response = [[YHHttpResponse alloc] initWithResponse:task responseObject:responseObject requestSuccessed:succeed error:error];
        complete(response);
    }
}



@end
