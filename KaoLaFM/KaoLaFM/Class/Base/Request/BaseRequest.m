//
//  BaseRequest.m
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseRequest.h"
#import "YXGCacheHelper.h"
#import "YXGNetWorkingStatus.h"

@implementation BaseRequest

+(instancetype)sharedManager{
    static BaseRequest *reqManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reqManager = [self yxg_request];
    });
    return reqManager;
}

#pragma mark - 构造
+ (instancetype)yxg_request {
    return [[self alloc] init];
}

-(void)requestWithURL:(NSString *)url paramsDic:(NSDictionary *)paramsDic{
    if (url.length == 0 || [url isKindOfClass:[NSNull class]]) {
        return ;
    }
    self.yxg_url = url;
    self.paramsDic = paramsDic;
}
- (void)yxg_sendRequestWithMethod:(HTTPMethod)Method WithURL:(NSString *)url paramsDic:(NSDictionary *)paramsDic Completion:(FMAPIDicCompletion)completion{
    if (url.length == 0 || [url isKindOfClass:[NSNull class]]) {
        return ;
    }
    self.yxg_url = url;
    self.paramsDic = paramsDic;

    switch (Method) {
        case POST:
            [self POST_sendRequestWithCompletion:completion];
            break;
        case GET:
            [self GET_sendRequestWithCompletion:completion];
            break;
        default:
            break;
    }
}

- (void)POST_sendRequestWithCompletion:(FMAPIDicCompletion)completion{
    [self.manager POST:self.yxg_url parameters:self.paramsDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject, YES, @"");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, NO, @"");

    }];
}

- (void)GET_sendRequestWithCompletion:(FMAPIDicCompletion)completion {
    
    //获取网络状态
    YXGNetworkStatus YXG_networkingStatus = kYXGNetWorkStatusReachableViaWifi;//[YXGNetWorkingStatus networkingStatus];
//        AFHTTPSessionManager *manager = [self createManager];
        [self.manager GET:self.yxg_url parameters:self.paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //数据请求成功的block回调
            completion(responseObject, YES, @"");
            //缓存数据
            [YXGCacheHelper saveResponseCache:responseObject forKey:self.yxg_url];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
            DDLog(@"文件大小:%lu", [data length]/1024);

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
            if (YXG_networkingStatus == kYXGNetWorkStatusUnknown || YXG_networkingStatus == kYXGNetWorkStatusNotReachable) {
                //从缓存里面获取数据
                id response = [YXGCacheHelper getResponseCacheForKey:self.yxg_url];
                if (response) {
                    completion(response, YES, @"");
                }
            }else{
                completion(nil, NO, @"");
            }

        }];
    
}

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        [_manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [_manager.requestSerializer setValue:@"JSESSIONID=1syrr72gajqkz1ppqnr1s6fkbc" forHTTPHeaderField:@"Cookie"];
        [_manager.requestSerializer setValue:@"KaolaFM/5.0.1 (iPhone; iOS 10.3.1; Scale/2.00)"forHTTPHeaderField:@"User-Agent"];
        [_manager.requestSerializer setValue:@"zh-Hans-CN;q=1" forHTTPHeaderField:@"Accept-Language"];
        [_manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
        [_manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        [_manager.requestSerializer setValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];

    }
    return _manager;

}

@end
