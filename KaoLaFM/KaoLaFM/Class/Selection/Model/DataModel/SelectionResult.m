//
//  SelectionResult.m
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SelectionResult.h"
#import "SelectionDataList.h"


NSString *const kSelectionResultDataList = @"dataList";


@interface SelectionResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SelectionResult

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
    NSObject *receivedSelectionDataList = [dict objectForKey:kSelectionResultDataList];
    NSMutableArray *parsedSelectionDataList = [NSMutableArray array];
    if ([receivedSelectionDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSelectionDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSelectionDataList addObject:[SelectionDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSelectionDataList isKindOfClass:[NSDictionary class]]) {
       [parsedSelectionDataList addObject:[SelectionDataList modelObjectWithDictionary:(NSDictionary *)receivedSelectionDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedSelectionDataList];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kSelectionResultDataList];

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

    self.dataList = [aDecoder decodeObjectForKey:kSelectionResultDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataList forKey:kSelectionResultDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    SelectionResult *copy = [[SelectionResult alloc] init];
    
    if (copy) {

        copy.dataList = [self.dataList copyWithZone:zone];
    }
    
    return copy;
}


@end
