//
//  YXGDBHelper.h
//  KaoLaFM
//
//  Created by rongyun on 2017/8/15.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXGDBHelper : NSObject

@property (nonatomic,strong,readonly) FMDatabaseQueue *dbQueue;

+ (YXGDBHelper *)shareInstance;

+ (NSString *)dbPatch;

- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName;

@end
