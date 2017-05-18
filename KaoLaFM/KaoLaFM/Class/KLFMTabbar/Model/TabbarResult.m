//
//  TabbarResult.m
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "TabbarResult.h"
#import "TabbarDataList.h"


NSString *const kTabbarResultDataList = @"dataList";


@interface TabbarResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TabbarResult

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
    NSObject *receivedTabbarDataList = [dict objectForKey:kTabbarResultDataList];
    NSMutableArray *parsedTabbarDataList = [NSMutableArray array];
    if ([receivedTabbarDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTabbarDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTabbarDataList addObject:[TabbarDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTabbarDataList isKindOfClass:[NSDictionary class]]) {
       [parsedTabbarDataList addObject:[TabbarDataList modelObjectWithDictionary:(NSDictionary *)receivedTabbarDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedTabbarDataList];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kTabbarResultDataList];

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

    self.dataList = [aDecoder decodeObjectForKey:kTabbarResultDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataList forKey:kTabbarResultDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    TabbarResult *copy = [[TabbarResult alloc] init];
    
    if (copy) {

        copy.dataList = [self.dataList copyWithZone:zone];
    }
    
    return copy;
}


@end
