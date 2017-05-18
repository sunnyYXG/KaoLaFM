//
//  SelectionBaseClass.h
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SelectionResult;

@interface SelectionBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SelectionResult *result;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
