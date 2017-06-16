//
//  DiscoverBaseClass.m
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DiscoverBaseClass.h"
#import "DiscoverResult.h"


NSString *const kDiscoverBaseClassResult = @"result";
NSString *const kDiscoverBaseClassMessage = @"message";
NSString *const kDiscoverBaseClassCode = @"code";
NSString *const kDiscoverBaseClassServerTime = @"serverTime";


@interface DiscoverBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DiscoverBaseClass

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
            self.result = [DiscoverResult modelObjectWithDictionary:[dict objectForKey:kDiscoverBaseClassResult]];
            self.message = [self objectOrNilForKey:kDiscoverBaseClassMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kDiscoverBaseClassCode fromDictionary:dict];
            self.serverTime = [[self objectOrNilForKey:kDiscoverBaseClassServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kDiscoverBaseClassResult];
    [mutableDict setValue:self.message forKey:kDiscoverBaseClassMessage];
    [mutableDict setValue:self.code forKey:kDiscoverBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kDiscoverBaseClassServerTime];

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

    self.result = [aDecoder decodeObjectForKey:kDiscoverBaseClassResult];
    self.message = [aDecoder decodeObjectForKey:kDiscoverBaseClassMessage];
    self.code = [aDecoder decodeObjectForKey:kDiscoverBaseClassCode];
    self.serverTime = [aDecoder decodeDoubleForKey:kDiscoverBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kDiscoverBaseClassResult];
    [aCoder encodeObject:_message forKey:kDiscoverBaseClassMessage];
    [aCoder encodeObject:_code forKey:kDiscoverBaseClassCode];
    [aCoder encodeDouble:_serverTime forKey:kDiscoverBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    DiscoverBaseClass *copy = [[DiscoverBaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
