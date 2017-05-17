//
//  BaseRequest.h
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseRequestReponseDelegate <NSObject>
@required
/** 如果不用block返回数据的话，这个方法必须实现*/
- (void)requestSuccessReponse:(BOOL)success response:(id)response message:(NSString *)message;
@end

typedef void(^NHAPIDicCompletion)(id response, BOOL success, NSString *message);

@interface BaseRequest : NSObject

@property (nonatomic, weak) id <BaseRequestReponseDelegate> yxg_delegate;
/** 链接*/
@property (nonatomic, copy) NSString *yxg_url;
/** 默认GET*/
@property (nonatomic, assign) BOOL yxg_isPost;
/** 图片数组*/
@property (nonatomic, strong) NSArray <UIImage *>*yxg_imageArray;
/** 参数 */
@property (nonatomic, strong) NSDictionary *paramsDic;

/** 构造方法*/
+ (instancetype)yxg_request;
+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url;
+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url isPost:(BOOL)yxg_isPost;
+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url isPost:(BOOL)yxg_isPost delegate:(id <BaseRequestReponseDelegate>)yxg_delegate;


/** 开始请求，如果设置了代理，不需要block回调*/
- (void)yxg_sendRequest;
/** 开始请求，没有设置代理，或者设置了代理，需要block回调，block回调优先级高于代理*/
- (void)yxg_sendRequestWithCompletion:(NHAPIDicCompletion)completion;

+ (void)yxg_getCookiesWithPost;


@end
