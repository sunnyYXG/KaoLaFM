//
//  YXGNetWorkingStatus.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/27.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "YXGNetWorkingStatus.h"

static YXGNetworkStatus YXG_networkingStatus;

@implementation YXGNetWorkingStatus

+ (YXGNetworkStatus)networkingStatus{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
                NSLog(@"未知网络");
                YXG_networkingStatus = kYXGNetWorkStatusUnknown;
                break;
            case 0:
                NSLog(@"网络不可达");
                YXG_networkingStatus = kYXGNetWorkStatusNotReachable;
                break;
            case 1:
                NSLog(@"GPRS网络");
                YXG_networkingStatus = kYXGNetWorkStatusReachableViaWWAN;
                break;
            case 2:
                NSLog(@"wifi网络");
                YXG_networkingStatus = kYXGNetWorkStatusReachableViaWifi;
                break;
            default:
                break;
        }
    }];
    return YXG_networkingStatus;
}

@end
