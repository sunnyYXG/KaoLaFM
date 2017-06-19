//
//  singleton.m
//  Kaola
//
//  Created by rongyun on 17/5/4.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "singleton.h"
#import "playerView.h"

static singleton *sharedInstance=nil;

@implementation singleton

+ (singleton *)singletonSharedInstance {
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        sharedInstance = [[singleton alloc] init];
        sharedInstance.playerView = [[playerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64, SCREEN_WIDTH, playerViewHeight)];
        
    });
    return sharedInstance;
    
}


@end
