//
//  YXGDBHelper.m
//  KaoLaFM
//
//  Created by rongyun on 2017/8/15.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "YXGDBHelper.h"
#import "YXGDBModel.h"

@interface YXGDBHelper ()

@property (nonatomic,strong) FMDatabaseQueue *dbQueue;

@end

@implementation YXGDBHelper

static YXGDBHelper *_instance = nil;
+ (YXGDBHelper *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (NSString *)dbPathWithDirectoryName:(NSString *)directoryName{
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (directoryName == nil || directoryName.length == 0) {
        docsdir = [docsdir stringByAppendingPathComponent:@"YXGDB"];
    }else{
        docsdir = [docsdir stringByAppendingPathComponent:directoryName];
    }
    BOOL isDir;
    BOOL exit = [fileManager fileExistsAtPath:docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [fileManager createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbPath = [docsdir stringByAppendingPathComponent:@"yxgdb.sqlite"];
    return dbPath;
}

+ (NSString *)dbPatch{
    return [self dbPathWithDirectoryName:nil];
}

-(FMDatabaseQueue *)dbQueue{
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc]initWithPath:[self.class dbPatch]];
    }
    return _dbQueue;
}

-(BOOL)changeDBWithDirectoryName:(NSString *)directoryName{
    if (_instance.dbQueue) {
        _instance.dbQueue = nil;
    }
    _instance.dbQueue = [[FMDatabaseQueue alloc]initWithPath:[YXGDBHelper dbPathWithDirectoryName:directoryName]];
    
    int numClasses;
    Class *classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    if (numClasses > 0) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i ++) {
            if (class_getSuperclass(classes[i]) == [YXGDBModel class]) {
                id class = classes[i];
                [class performSelector:@selector(createTable) withObject:nil];
            }
        }
        free(classes);
    }
    return YES;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return  [YXGDBHelper shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return [YXGDBHelper shareInstance];
}

#if ! __has_feature(objc_arc)
- (oneway void)release
{
    
}

- (id)autorelease
{
    return _instance;
}

- (NSUInteger)retainCount
{
    return 1;
}
#endif




@end
