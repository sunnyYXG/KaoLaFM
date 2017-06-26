//
//  SubscribeDataList.m
//
//  Created by rongyun  on 2017/6/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SubscribeDataList.h"


NSString *const kSubscribeDataListLabels = @"labels";
NSString *const kSubscribeDataListIsSubscribe = @"isSubscribe";
NSString *const kSubscribeDataListImg = @"img";
NSString *const kSubscribeDataListId = @"id";
NSString *const kSubscribeDataListType = @"type";
NSString *const kSubscribeDataListDesc = @"desc";
NSString *const kSubscribeDataListName = @"name";


@interface SubscribeDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SubscribeDataList

@synthesize labels = _labels;
@synthesize isSubscribe = _isSubscribe;
@synthesize img = _img;
@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize type = _type;
@synthesize desc = _desc;
@synthesize name = _name;


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
            self.labels = [self objectOrNilForKey:kSubscribeDataListLabels fromDictionary:dict];
            self.isSubscribe = [[self objectOrNilForKey:kSubscribeDataListIsSubscribe fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kSubscribeDataListImg fromDictionary:dict];
            self.dataListIdentifier = [[self objectOrNilForKey:kSubscribeDataListId fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kSubscribeDataListType fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kSubscribeDataListDesc fromDictionary:dict];
            self.name = [self objectOrNilForKey:kSubscribeDataListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLabels = [NSMutableArray array];
    for (NSObject *subArrayObject in self.labels) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLabels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLabels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabels] forKey:kSubscribeDataListLabels];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSubscribe] forKey:kSubscribeDataListIsSubscribe];
    [mutableDict setValue:self.img forKey:kSubscribeDataListImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kSubscribeDataListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kSubscribeDataListType];
    [mutableDict setValue:self.desc forKey:kSubscribeDataListDesc];
    [mutableDict setValue:self.name forKey:kSubscribeDataListName];

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

    self.labels = [aDecoder decodeObjectForKey:kSubscribeDataListLabels];
    self.isSubscribe = [aDecoder decodeDoubleForKey:kSubscribeDataListIsSubscribe];
    self.img = [aDecoder decodeObjectForKey:kSubscribeDataListImg];
    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kSubscribeDataListId];
    self.type = [aDecoder decodeDoubleForKey:kSubscribeDataListType];
    self.desc = [aDecoder decodeObjectForKey:kSubscribeDataListDesc];
    self.name = [aDecoder decodeObjectForKey:kSubscribeDataListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_labels forKey:kSubscribeDataListLabels];
    [aCoder encodeDouble:_isSubscribe forKey:kSubscribeDataListIsSubscribe];
    [aCoder encodeObject:_img forKey:kSubscribeDataListImg];
    [aCoder encodeDouble:_dataListIdentifier forKey:kSubscribeDataListId];
    [aCoder encodeDouble:_type forKey:kSubscribeDataListType];
    [aCoder encodeObject:_desc forKey:kSubscribeDataListDesc];
    [aCoder encodeObject:_name forKey:kSubscribeDataListName];
}

- (id)copyWithZone:(NSZone *)zone
{
    SubscribeDataList *copy = [[SubscribeDataList alloc] init];
    
    if (copy) {

        copy.labels = [self.labels copyWithZone:zone];
        copy.isSubscribe = self.isSubscribe;
        copy.img = [self.img copyWithZone:zone];
        copy.dataListIdentifier = self.dataListIdentifier;
        copy.type = self.type;
        copy.desc = [self.desc copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
