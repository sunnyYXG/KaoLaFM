//
//  AppNotification.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/19.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "AppNotification.h"

@implementation AppNotification

+ (void)send: (NSString *)type {
    [[NSNotificationCenter defaultCenter] postNotificationName:type object:nil];
}

+ (void)send: (NSString *)type userInfo:(NSDictionary *)userInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:type object:nil userInfo:userInfo];
}

+ (void)registe: (NSString *)type receiver:(id)receiver action:(SEL)action {
    [[NSNotificationCenter defaultCenter] addObserver:receiver selector:action name:type object:nil];
}

+ (void)remove: (NSString *)type receiver:(id)receiver {
    [[NSNotificationCenter defaultCenter] removeObserver:receiver name:type object:nil];
}


@end
