//
//  DiscoverResult.m
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DiscoverResult.h"
#import "DiscoverDataList.h"


NSString *const kDiscoverResultDataList = @"dataList";


@interface DiscoverResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DiscoverResult

@synthesize dataList = _dataList;


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
    NSObject *receivedDiscoverDataList = [dict objectForKey:kDiscoverResultDataList];
    NSMutableArray *parsedDiscoverDataList = [NSMutableArray array];
    if ([receivedDiscoverDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDiscoverDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDiscoverDataList addObject:[DiscoverDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDiscoverDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDiscoverDataList addObject:[DiscoverDataList modelObjectWithDictionary:(NSDictionary *)receivedDiscoverDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedDiscoverDataList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kDiscoverResultDataList];

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

    self.dataList = [aDecoder decodeObjectForKey:kDiscoverResultDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataList forKey:kDiscoverResultDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DiscoverResult *copy = [[DiscoverResult alloc] init];
    
    if (copy) {

        copy.dataList = [self.dataList copyWithZone:zone];
    }
    
    return copy;
}


@end
