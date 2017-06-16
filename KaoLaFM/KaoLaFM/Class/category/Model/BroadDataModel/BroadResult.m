//
//  BroadResult.m
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BroadResult.h"
#import "BroadDataList.h"


NSString *const kBroadResultName = @"name";
NSString *const kBroadResultDataList = @"dataList";


@interface BroadResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BroadResult

@synthesize name = _name;
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
            self.name = [self objectOrNilForKey:kBroadResultName fromDictionary:dict];
    NSObject *receivedBroadDataList = [dict objectForKey:kBroadResultDataList];
    NSMutableArray *parsedBroadDataList = [NSMutableArray array];
    if ([receivedBroadDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBroadDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBroadDataList addObject:[BroadDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBroadDataList isKindOfClass:[NSDictionary class]]) {
       [parsedBroadDataList addObject:[BroadDataList modelObjectWithDictionary:(NSDictionary *)receivedBroadDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedBroadDataList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kBroadResultName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kBroadResultDataList];

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

    self.name = [aDecoder decodeObjectForKey:kBroadResultName];
    self.dataList = [aDecoder decodeObjectForKey:kBroadResultDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kBroadResultName];
    [aCoder encodeObject:_dataList forKey:kBroadResultDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    BroadResult *copy = [[BroadResult alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.dataList = [self.dataList copyWithZone:zone];
    }
    
    return copy;
}


@end
