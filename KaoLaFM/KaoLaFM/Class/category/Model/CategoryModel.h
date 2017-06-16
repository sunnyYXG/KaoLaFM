//
//  CategoryModel.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLFMCategoryVC.h"
@class CategoryBaseClass,BroadBaseClass;

@interface CategoryModel : NSObject

+ (void)ModelResolver:(CategoryBaseClass *)baseModel VC:(UIViewController *)VC type:(CategoryDataComponentType)dataType;


+ (void)ModelResolverWithBroadModel:(BroadBaseClass *)broadModel VC:(UIViewController *)VC;

@end
