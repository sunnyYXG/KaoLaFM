//
//  CategoryResult.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryResult.h"
#import "CategoryDataList.h"


NSString *const kCategoryResultName = @"name";
NSString *const kCategoryResultDataList = @"dataList";


@interface CategoryResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryResult

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
            self.name = [self objectOrNilForKey:kCategoryResultName fromDictionary:dict];
    NSObject *receivedCategoryDataList = [dict objectForKey:kCategoryResultDataList];
    NSMutableArray *parsedCategoryDataList = [NSMutableArray array];
    if ([receivedCategoryDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategoryDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategoryDataList addObject:[CategoryDataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategoryDataList isKindOfClass:[NSDictionary class]]) {
       [parsedCategoryDataList addObject:[CategoryDataList modelObjectWithDictionary:(NSDictionary *)receivedCategoryDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedCategoryDataList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kCategoryResultName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kCategoryResultDataList];

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

    self.name = [aDecoder decodeObjectForKey:kCategoryResultName];
    self.dataList = [aDecoder decodeObjectForKey:kCategoryResultDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kCategoryResultName];
    [aCoder encodeObject:_dataList forKey:kCategoryResultDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryResult *copy = [[CategoryResult alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.dataList = [self.dataList copyWithZone:zone];
    }
    
    return copy;
}


@end
