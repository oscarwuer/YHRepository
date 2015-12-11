//
//  YHHttpResponse.h
//  Oscar
//
//  Created by yahui.zhang on 15/12/11.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHHttpResponse : NSObject

- (instancetype)initWithResponse:(NSURLSessionDataTask *)dataTask
                  responseObject:(id)responseObject
                requestSuccessed:(BOOL)requestSuccessed
                           error:(NSError *)error;

@property (strong, nonatomic, readonly)NSDictionary *responseDic;

@property (assign, nonatomic, readonly)BOOL requestSuccessed;

@property (assign, nonatomic, readonly)NSInteger statusCode;

@property (strong, nonatomic, readonly)NSError *error;

@end
