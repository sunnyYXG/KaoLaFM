//
//  SingletonManager.m
//  Kaola
//
//  Created by rongyun on 17/5/4.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SingletonManager.h"
#import "YXGAVPlayerView.h"

static SingletonManager *sharedInstance=nil;

@implementation SingletonManager

+ (SingletonManager *)SingletonManagerSharedInstance {
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        sharedInstance = [[SingletonManager alloc] init];
        sharedInstance.playerView = [[YXGAVPlayerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64, SCREEN_WIDTH, playerViewHeight)];
        
    });
    return sharedInstance;
    
}


@end
