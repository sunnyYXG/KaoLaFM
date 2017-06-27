//
//  YXGNetWorkingStatus.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/27.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 网络状态
 */
typedef NS_ENUM (NSInteger, YXGNetworkStatus)
{
    kYXGNetWorkStatusUnknown = -1, //未知网络
    kYXGNetWorkStatusNotReachable = 0,//网络无连接
    kYXGNetWorkStatusReachableViaWWAN = 1,//2,3,4g
    kYXGNetWorkStatusReachableViaWifi = 2, //wifi网络
};

@interface YXGNetWorkingStatus : NSObject

+ (YXGNetworkStatus)networkingStatus;

@end
