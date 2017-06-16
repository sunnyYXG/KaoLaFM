//
//  BroadDataList.m
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BroadDataList.h"


NSString *const kBroadDataListId = @"id";
NSString *const kBroadDataListLabel = @"label";
NSString *const kBroadDataListPic = @"pic";
NSString *const kBroadDataListName = @"name";
NSString *const kBroadDataListType = @"type";


@interface BroadDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BroadDataList

@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize label = _label;
@synthesize pic = _pic;
@synthesize name = _name;
@synthesize type = _type;


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
            self.dataListIdentifier = [[self objectOrNilForKey:kBroadDataListId fromDictionary:dict] doubleValue];
            self.label = [[self objectOrNilForKey:kBroadDataListLabel fromDictionary:dict] doubleValue];
            self.pic = [self objectOrNilForKey:kBroadDataListPic fromDictionary:dict];
            self.name = [self objectOrNilForKey:kBroadDataListName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kBroadDataListType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kBroadDataListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.label] forKey:kBroadDataListLabel];
    [mutableDict setValue:self.pic forKey:kBroadDataListPic];
    [mutableDict setValue:self.name forKey:kBroadDataListName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kBroadDataListType];

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

    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kBroadDataListId];
    self.label = [aDecoder decodeDoubleForKey:kBroadDataListLabel];
    self.pic = [aDecoder decodeObjectForKey:kBroadDataListPic];
    self.name = [aDecoder decodeObjectForKey:kBroadDataListName];
    self.type = [aDecoder decodeDoubleForKey:kBroadDataListType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataListIdentifier forKey:kBroadDataListId];
    [aCoder encodeDouble:_label forKey:kBroadDataListLabel];
    [aCoder encodeObject:_pic forKey:kBroadDataListPic];
    [aCoder encodeObject:_name forKey:kBroadDataListName];
    [aCoder encodeDouble:_type forKey:kBroadDataListType];
}

- (id)copyWithZone:(NSZone *)zone
{
    BroadDataList *copy = [[BroadDataList alloc] init];
    
    if (copy) {

        copy.dataListIdentifier = self.dataListIdentifier;
        copy.label = self.label;
        copy.pic = [self.pic copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
