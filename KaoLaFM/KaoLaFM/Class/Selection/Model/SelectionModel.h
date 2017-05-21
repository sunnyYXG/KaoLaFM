//
//  SelectionModel.h
//  KaoLaFM
//
//  Created by rongyun on 17/5/18.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SelectionBaseClass;

@interface SelectionModel : NSObject

+ (NSDictionary *)ModelResolver:(SelectionBaseClass *)baseModel VC:(UIViewController *)VC;

@end
