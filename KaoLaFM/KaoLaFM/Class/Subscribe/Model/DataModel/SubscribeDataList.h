//
//  SubscribeDataList.h
//
//  Created by rongyun  on 2017/6/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SubscribeDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, assign) double isSubscribe;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double dataListIdentifier;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
