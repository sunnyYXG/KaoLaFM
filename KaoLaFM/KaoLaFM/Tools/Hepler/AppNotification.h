//
//  AppNotification.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/19.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

//添加播放器的通知 cell上面点击
#define NOTIFICATION_TYPE_PALYER @"NOTIFICATION_PALYER"
#define PALYER_KEY @"player_data"

@interface AppNotification : NSObject

+ (void)send: (NSString *)type;

+ (void)send: (NSString *)type userInfo:(NSDictionary *)userInfo;

+ (void)registe: (NSString *)type receiver:(id)receiver action:(SEL)action;

+ (void)remove: (NSString *)type receiver:(id)receiver;

@end
