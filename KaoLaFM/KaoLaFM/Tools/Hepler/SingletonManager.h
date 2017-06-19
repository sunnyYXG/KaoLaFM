//
//  SingletonManager.h
//  Kaola
//
//  Created by rongyun on 17/5/4.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YXGAVPlayerView;

@interface SingletonManager : NSObject

@property (nonatomic)YXGAVPlayerView *playerView;

+ (SingletonManager *)SingletonManagerSharedInstance;
@end
