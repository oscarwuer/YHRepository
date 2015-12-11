//
//  YHHttpResponse.m
//  Oscar
//
//  Created by yahui.zhang on 15/12/11.
//  Copyright © 2015年 yahui.zhang. All rights reserved.
//

#import "YHHttpResponse.h"

@interface YHHttpResponse ()

@property (strong, nonatomic)NSDictionary *responseDic;

@property (assign, nonatomic)NSInteger statusCode;

@property (assign, nonatomic)BOOL requestSuccessed;

@property (strong, nonatomic)NSError *error;


@end

@implementation YHHttpResponse

- (instancetype)initWithResponse:(NSURLSessionDataTask *)dataTask
                  responseObject:(id)responseObject
                requestSuccessed:(BOOL)requestSuccessed
                           error:(NSError *)error
{
    self = [super init];
    
    if (self)
    {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)dataTask.response;
        
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            self.responseDic = responseObject;
        }
        else if([responseObject isKindOfClass:[NSString class]])
        {
            NSData *responseData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
            self.responseDic = [NSJSONSerialization JSONObjectWithData:responseData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:nil];
        }
        else if([responseObject isKindOfClass:[NSData class]])
        {
            self.responseDic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                               options:NSJSONReadingMutableContainers
                                                                 error:nil];
        }
        
        self.statusCode = response.statusCode;
        
        self.requestSuccessed = requestSuccessed;
        
        self.error = error;
    }
    return self;
}

@end
