//
//  CategoryBaseClass.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryBaseClass.h"
#import "CategoryResult.h"


NSString *const kCategoryBaseClassResult = @"result";
NSString *const kCategoryBaseClassMessage = @"message";
NSString *const kCategoryBaseClassCode = @"code";
NSString *const kCategoryBaseClassServerTime = @"serverTime";


@interface CategoryBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryBaseClass

@synthesize result = _result;
@synthesize message = _message;
@synthesize code = _code;
@synthesize serverTime = _serverTime;


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
            self.result = [CategoryResult modelObjectWithDictionary:[dict objectForKey:kCategoryBaseClassResult]];
            self.message = [self objectOrNilForKey:kCategoryBaseClassMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kCategoryBaseClassCode fromDictionary:dict];
            self.serverTime = [[self objectOrNilForKey:kCategoryBaseClassServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kCategoryBaseClassResult];
    [mutableDict setValue:self.message forKey:kCategoryBaseClassMessage];
    [mutableDict setValue:self.code forKey:kCategoryBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kCategoryBaseClassServerTime];

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

    self.result = [aDecoder decodeObjectForKey:kCategoryBaseClassResult];
    self.message = [aDecoder decodeObjectForKey:kCategoryBaseClassMessage];
    self.code = [aDecoder decodeObjectForKey:kCategoryBaseClassCode];
    self.serverTime = [aDecoder decodeDoubleForKey:kCategoryBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kCategoryBaseClassResult];
    [aCoder encodeObject:_message forKey:kCategoryBaseClassMessage];
    [aCoder encodeObject:_code forKey:kCategoryBaseClassCode];
    [aCoder encodeDouble:_serverTime forKey:kCategoryBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryBaseClass *copy = [[CategoryBaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
