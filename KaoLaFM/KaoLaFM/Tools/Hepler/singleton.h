//
//  singleton.h
//  Kaola
//
//  Created by rongyun on 17/5/4.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class playerView;
@interface singleton : NSObject

@property (nonatomic)playerView *playerView;


+ (singleton *)singletonSharedInstance;
@end
