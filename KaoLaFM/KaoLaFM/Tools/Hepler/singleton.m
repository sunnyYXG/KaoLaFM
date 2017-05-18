//
//  singleton.m
//  Kaola
//
//  Created by rongyun on 17/5/4.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "singleton.h"

@implementation singleton

+ (id)singletonSharedInstance {
    
    static dispatch_once_t once;
    
    static id sharedInstance;
    dispatch_once(&once, ^{
        
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    
}

@end
