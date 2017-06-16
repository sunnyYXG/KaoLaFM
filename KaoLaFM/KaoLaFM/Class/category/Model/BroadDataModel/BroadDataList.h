//
//  BroadDataList.h
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BroadDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataListIdentifier;
@property (nonatomic, assign) double label;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
