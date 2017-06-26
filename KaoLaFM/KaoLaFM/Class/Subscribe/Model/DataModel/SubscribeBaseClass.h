//
//  SubscribeBaseClass.h
//
//  Created by rongyun  on 2017/6/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SubscribeResult;

@interface SubscribeBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SubscribeResult *result;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
