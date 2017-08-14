//
//  BaseRequest.h
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;


//使用block对请求的数据进行回调处理
typedef void(^FMAPIDicCompletion)(id response, BOOL success, NSString *message);

@interface BaseRequest : NSObject

/** 链接*/
@property (nonatomic, copy) NSString *yxg_url;
/** 参数 */
@property (nonatomic, strong) NSDictionary *paramsDic;

@property (nonatomic,strong) AFHTTPSessionManager *manager;

/** 构造方法*/
+ (instancetype)yxg_request;

+ (instancetype)sharedManager;
- (void)requestWithURL:(NSString *)url paramsDic:(NSDictionary *)paramsDic;
- (void)yxg_sendRequestWithMethod:(HTTPMethod)Method WithURL:(NSString *)url paramsDic:(NSDictionary *)paramsDic Completion:(FMAPIDicCompletion)completion;


@end
