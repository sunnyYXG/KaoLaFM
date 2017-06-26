//
//  SubscribeModel.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SubscribeBaseClass;

@interface SubscribeModel : NSObject

+ (void)ModelResolver:(SubscribeBaseClass *)baseModel VC:(UIViewController *)VC;

@end
