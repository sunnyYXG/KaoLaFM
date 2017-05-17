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

- (void)yxg_sendRequestWithCompletion:(NHAPIDicCompletion)completion {

        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain",@"text/json", @"text/javascript", nil];
    [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"current_env=online; JSESSIONID-WKL-8IO=f%5CVaXefXjXMrm85J8zNPyYZDl47q3pARbvQxWERxQQtyD4Zp%5Ctg8OczcJC7bY1CPW4%2BdPa%2B0keagAVkgQKy%2FZpz8I%5CEfyJePKI76dNOWnA7ay7OOTHKoaDfk6upKOI%2FBJMMCBXwCkvjyxLjeKf4ivApr8mRCecWTuVtUv4QKSWUzRh5J%3A1493083618249; _klhtxd_=31; _pzfxuvpc=1490692740694%7C1305373723616433202%7C30%7C1491873165215%7C9%7C7252243094873242310%7C1395660636497478613; _ga=GA1.2.1507906303.1490692741; _ntes_nnid=fe04ccbb065d725608fccf1fe2c74c38,1490692740047; __kaola_usertrack=20170328171859918114; _da_ntes_uid=20170328171859918114" forHTTPHeaderField:@"Cookie"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [manager.requestSerializer setValue:@"C76FC330-F1D0-4DBC-AF6F-74BA8D27F5B2" forHTTPHeaderField:@"deviceUdID"];
    [manager.requestSerializer setValue:@"30600" forHTTPHeaderField:@"version"];
    [manager.requestSerializer setValue:@"3.6.0" forHTTPHeaderField:@"appVersion"];
    [manager.requestSerializer setValue:@"10.3.1" forHTTPHeaderField:@"appSystemVersion"];
    [manager.requestSerializer setValue:@"zh-Hans-CN;q=1" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"206" forHTTPHeaderField:@"apiVersion"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"platform"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"HTSpring/3.6.0 (iPhone; iOS 10.3.1; Scale/2.00)" forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"iPhone 5S (Global)" forHTTPHeaderField:@"deviceModel"];
    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"appChannel"];

            [manager GET:self.yxg_url parameters:self.paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            /*
            NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:home_url]];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];

            NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
            if([cookiesdata length]) {
                NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
                DDLog(@"cookies:%@",cookies);
                NSHTTPCookie *cookie;
                for (cookie in cookies) {
                    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
                }
            }  
*/
            
            //数据请求成功的block回调
            completion(responseObject, YES, @"");
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
        }];
    
}


+(void)yxg_getCookiesWithPost{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSDictionary *dic = @{@"httimestamp":@"1492408547"};
    [manager POST:login_url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
#if 1
        NSLog(@"\n======================================\n");
        NSDictionary *fields = ((NSHTTPURLResponse*)task.response).allHeaderFields;
        NSLog(@"fields = %@",[fields description]);
        NSURL *url = [NSURL URLWithString:@"http://log-collector.kaola.com/api/alarmCommon?_httimestamp=1492407604"];
        NSLog(@"\n======================================\n");
        //获取cookie方法1
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
        for (NSHTTPCookie *cookie in cookies) {
            NSLog(@"cookie,name:= %@,valuie = %@",cookie.name,cookie.value);
        }
        NSLog(@"\n======================================\n");
        //        //获取cookie方法2
        //        NSString *cookies2 = [((NSHTTPURLResponse*)task.response) valueForKey:@"Set-Cookie"];
        //        NSLog(@"cookies2 = %@",[cookies2 description]);
        /*
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        for (NSHTTPCookie *cookie in cookies) {
            // Here I see the correct rails session cookie
            NSLog(@"cookie: %@", cookie);
        }
        
        NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
        DDLog(@"cookiesData:%@",cookiesData);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject: cookiesData forKey: @"sessionCookies"];
        [defaults synchronize];
*/
        /*
        NSDictionary *fields = [responseObject allHeaderFields];
        NSLog(@"fields = %@",[fields description]);
        NSURL *url = [NSURL URLWithString:login_url];
        //获取cookie方法1
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
        NSLog(@"cookies11--%@",cookies);
        
        //获取cookie方法2
        //NSString *cookieString = [[HTTPResponse allHeaderFields] valueForKey:@"Set-Cookie"];
         */

#else
        //获取cookie
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage]cookiesForURL:[NSURL URLWithString:login_url]];
        for (NSHTTPCookie *tempCookie in cookies)
        {
            //打印cookies
            NSLog(@"getCookie:%@",tempCookie);
        }
        
        
        NSDictionary *Request = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        NSUserDefaults *userCookies = [NSUserDefaults standardUserDefaults];
        [userCookies setObject:[Request objectForKey:@"Cookie"] forKey:@"mUserDefaultsCookie"];
        [userCookies synchronize];
        
        DDLog(@"cookies:%@",cookies);

        
#endif
        
        
        

        
        //
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
}




@end
