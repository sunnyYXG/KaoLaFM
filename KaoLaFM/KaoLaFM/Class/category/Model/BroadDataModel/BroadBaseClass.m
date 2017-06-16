//
//  BroadBaseClass.m
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BroadBaseClass.h"
#import "BroadResult.h"


NSString *const kBroadBaseClassResult = @"result";
NSString *const kBroadBaseClassMessage = @"message";
NSString *const kBroadBaseClassCode = @"code";
NSString *const kBroadBaseClassServerTime = @"serverTime";


@interface BroadBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BroadBaseClass

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
            self.result = [BroadResult modelObjectWithDictionary:[dict objectForKey:kBroadBaseClassResult]];
            self.message = [self objectOrNilForKey:kBroadBaseClassMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kBroadBaseClassCode fromDictionary:dict];
            self.serverTime = [[self objectOrNilForKey:kBroadBaseClassServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kBroadBaseClassResult];
    [mutableDict setValue:self.message forKey:kBroadBaseClassMessage];
    [mutableDict setValue:self.code forKey:kBroadBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kBroadBaseClassServerTime];

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

    self.result = [aDecoder decodeObjectForKey:kBroadBaseClassResult];
    self.message = [aDecoder decodeObjectForKey:kBroadBaseClassMessage];
    self.code = [aDecoder decodeObjectForKey:kBroadBaseClassCode];
    self.serverTime = [aDecoder decodeDoubleForKey:kBroadBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kBroadBaseClassResult];
    [aCoder encodeObject:_message forKey:kBroadBaseClassMessage];
    [aCoder encodeObject:_code forKey:kBroadBaseClassCode];
    [aCoder encodeDouble:_serverTime forKey:kBroadBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    BroadBaseClass *copy = [[BroadBaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
