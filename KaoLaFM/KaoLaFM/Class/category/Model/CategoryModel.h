//
//  CategoryModel.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CategoryBaseClass;

@interface CategoryModel : NSObject

+ (void)ModelResolver:(CategoryBaseClass *)baseModel VC:(UIViewController *)VC;

@end
