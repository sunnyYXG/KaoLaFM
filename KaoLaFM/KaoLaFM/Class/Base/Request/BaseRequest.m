//
//  BaseRequest.m
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

#pragma mark - 构造
+ (instancetype)yxg_request {
    return [[self alloc] init];
}

+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url {
    return [self yxg_requestWithUrl:yxg_url isPost:NO];
}

+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url isPost:(BOOL)yxg_isPost {
    return [self yxg_requestWithUrl:yxg_url isPost:yxg_isPost delegate:nil];
}

+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url isPost:(BOOL)yxg_isPost delegate:(id <BaseRequestReponseDelegate>)yxg_delegate {
    BaseRequest *request = [self yxg_request];
    request.yxg_url = yxg_url;
    request.yxg_isPost = yxg_isPost;
    request.yxg_delegate = yxg_delegate;
    return request;
}

-(void)setYxg_url:(NSString *)yxg_url{
    if (yxg_url.length == 0 || [yxg_url isKindOfClass:[NSNull class]]) {
        return ;
    }
    _yxg_url = yxg_url;

}
-(void)yxg_sendRequest{
    [self yxg_sendRequestWithCompletion:nil];
}

- (void)yxg_sendRequestWithCompletion:(FMAPIDicCompletion)completion {
    AFHTTPSessionManager *manager = [self createManager];

        [manager GET:self.yxg_url parameters:self.paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //数据请求成功的block回调
            completion(responseObject, YES, @"");
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
            completion(nil, NO, @"");
            
        }];
}

- (AFHTTPSessionManager *)createManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"JSESSIONID=1syrr72gajqkz1ppqnr1s6fkbc" forHTTPHeaderField:@"Cookie"];
    [manager.requestSerializer setValue:@"KaolaFM/5.0.1 (iPhone; iOS 10.3.1; Scale/2.00)"forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"zh-Hans-CN;q=1" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [manager.requestSerializer setValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    return manager;
}


@end
