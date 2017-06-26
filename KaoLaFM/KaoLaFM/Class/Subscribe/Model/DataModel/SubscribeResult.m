//
//  SubscribeResult.m
//
//  Created by rongyun  on 2017/6/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SubscribeResult.h"
#import "SubscribeDataList.h"


NSString *const kSubscribeResultPageSize = @"pageSize";
NSString *const kSubscribeResultHaveNext = @"haveNext";
NSString *const kSubscribeResultDataList = @"dataList";
NSString *const kSubscribeResultCurrentPage = @"currentPage";
NSString *const kSubscribeResultCount = @"count";
NSString *const kSubscribeResultNextPage = @"nextPage";
NSString *const kSubscribeResultHavePre = @"havePre";
NSString *const kSubscribeResultPrePage = @"prePage";
NSString *const kSubscribeResultSumPage = @"sumPage";


@interface SubscribeResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SubscribeResult

@synthesize pageSize = _pageSize;
@synthesize haveNext = _haveNext;
@synthesize dataList = _dataList;
@synthesize currentPage = _currentPage;
@synthesize count = _count;
@synthesize nextPage = _nextPage;
@synthesize havePre = _havePre;
@synthesize prePage = _prePage;
@synthesize sumPage = _sumPage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pageSize = [[self objectOrNilForKey:kSubscribeResultPageSize fromDictionary:dict] doubleValue];
            self.haveNext = [[self objectOrNilForKey:kSubscribeResultHaveNext fromDictionary:dict] doubleValue];
    NSObject *receivedSubscribeDataList = [dict objectForKey:kSubscribeResultDataList];
    NSMutableArray *parsedSubscribeDataList = [NSMutableArray array];
    if ([receivedSubscribeDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSubscribeDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSubscribeDataList addObject:[SubscribeDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSubscribeDataList isKindOfClass:[NSDictionary class]]) {
       [parsedSubscribeDataList addObject:[SubscribeDataList modelObjectWithDictionary:(NSDictionary *)receivedSubscribeDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedSubscribeDataList];
            self.currentPage = [[self objectOrNilForKey:kSubscribeResultCurrentPage fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kSubscribeResultCount fromDictionary:dict] doubleValue];
            self.nextPage = [[self objectOrNilForKey:kSubscribeResultNextPage fromDictionary:dict] doubleValue];
            self.havePre = [[self objectOrNilForKey:kSubscribeResultHavePre fromDictionary:dict] doubleValue];
            self.prePage = [[self objectOrNilForKey:kSubscribeResultPrePage fromDictionary:dict] doubleValue];
            self.sumPage = [[self objectOrNilForKey:kSubscribeResultSumPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kSubscribeResultPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.haveNext] forKey:kSubscribeResultHaveNext];
    NSMutableArray *tempArrayForDataList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dataList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDataList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDataList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kSubscribeResultDataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentPage] forKey:kSubscribeResultCurrentPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kSubscribeResultCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextPage] forKey:kSubscribeResultNextPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.havePre] forKey:kSubscribeResultHavePre];
    [mutableDict setValue:[NSNumber numberWithDouble:self.prePage] forKey:kSubscribeResultPrePage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sumPage] forKey:kSubscribeResultSumPage];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.pageSize = [aDecoder decodeDoubleForKey:kSubscribeResultPageSize];
    self.haveNext = [aDecoder decodeDoubleForKey:kSubscribeResultHaveNext];
    self.dataList = [aDecoder decodeObjectForKey:kSubscribeResultDataList];
    self.currentPage = [aDecoder decodeDoubleForKey:kSubscribeResultCurrentPage];
    self.count = [aDecoder decodeDoubleForKey:kSubscribeResultCount];
    self.nextPage = [aDecoder decodeDoubleForKey:kSubscribeResultNextPage];
    self.havePre = [aDecoder decodeDoubleForKey:kSubscribeResultHavePre];
    self.prePage = [aDecoder decodeDoubleForKey:kSubscribeResultPrePage];
    self.sumPage = [aDecoder decodeDoubleForKey:kSubscribeResultSumPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kSubscribeResultPageSize];
    [aCoder encodeDouble:_haveNext forKey:kSubscribeResultHaveNext];
    [aCoder encodeObject:_dataList forKey:kSubscribeResultDataList];
    [aCoder encodeDouble:_currentPage forKey:kSubscribeResultCurrentPage];
    [aCoder encodeDouble:_count forKey:kSubscribeResultCount];
    [aCoder encodeDouble:_nextPage forKey:kSubscribeResultNextPage];
    [aCoder encodeDouble:_havePre forKey:kSubscribeResultHavePre];
    [aCoder encodeDouble:_prePage forKey:kSubscribeResultPrePage];
    [aCoder encodeDouble:_sumPage forKey:kSubscribeResultSumPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    SubscribeResult *copy = [[SubscribeResult alloc] init];
    
    if (copy) {

        copy.pageSize = self.pageSize;
        copy.haveNext = self.haveNext;
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.currentPage = self.currentPage;
        copy.count = self.count;
        copy.nextPage = self.nextPage;
        copy.havePre = self.havePre;
        copy.prePage = self.prePage;
        copy.sumPage = self.sumPage;
    }
    
    return copy;
}


@end
