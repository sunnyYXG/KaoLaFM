//
//  SubscribeResult.h
//
//  Created by rongyun  on 2017/6/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SubscribeResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double haveNext;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, assign) double currentPage;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double nextPage;
@property (nonatomic, assign) double havePre;
@property (nonatomic, assign) double prePage;
@property (nonatomic, assign) double sumPage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
