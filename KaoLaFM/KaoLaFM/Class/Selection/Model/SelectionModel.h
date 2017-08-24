//
//  SelectionModel.h
//  KaoLaFM
//
//  Created by rongyun on 17/5/18.
//  Copyright © 2017年 YXGang. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "YXGDBModel.h"
@class SelectionBaseClass;

//typedef void(^SelectionModelCompletion)(NSDictionary *modelDic, BOOL success);
//typedef void(^SelectionModelCompletion)(NSDictionary *modelDic, BOOL success);

@interface SelectionModel : YXGDBModel

@property (nonatomic) NSString *name;

+ (NSDictionary *)ModelResolver:(SelectionBaseClass *)baseModel VC:(UIViewController *)VC;

+ (void)handleModelWith:(SelectionBaseClass *)baseModel success:(void (^)(NSDictionary *modelDic, BOOL success))success failure:(void (^)(BOOL failure))failure;

@end
