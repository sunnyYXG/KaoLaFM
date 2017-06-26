//
//  SubscribeBaseClass.m
//
//  Created by rongyun  on 2017/6/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SubscribeBaseClass.h"
#import "SubscribeResult.h"


NSString *const kSubscribeBaseClassResult = @"result";
NSString *const kSubscribeBaseClassMessage = @"message";
NSString *const kSubscribeBaseClassCode = @"code";
NSString *const kSubscribeBaseClassServerTime = @"serverTime";


@interface SubscribeBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SubscribeBaseClass

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
            self.result = [SubscribeResult modelObjectWithDictionary:[dict objectForKey:kSubscribeBaseClassResult]];
            self.message = [self objectOrNilForKey:kSubscribeBaseClassMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kSubscribeBaseClassCode fromDictionary:dict];
            self.serverTime = [[self objectOrNilForKey:kSubscribeBaseClassServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kSubscribeBaseClassResult];
    [mutableDict setValue:self.message forKey:kSubscribeBaseClassMessage];
    [mutableDict setValue:self.code forKey:kSubscribeBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kSubscribeBaseClassServerTime];

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

    self.result = [aDecoder decodeObjectForKey:kSubscribeBaseClassResult];
    self.message = [aDecoder decodeObjectForKey:kSubscribeBaseClassMessage];
    self.code = [aDecoder decodeObjectForKey:kSubscribeBaseClassCode];
    self.serverTime = [aDecoder decodeDoubleForKey:kSubscribeBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kSubscribeBaseClassResult];
    [aCoder encodeObject:_message forKey:kSubscribeBaseClassMessage];
    [aCoder encodeObject:_code forKey:kSubscribeBaseClassCode];
    [aCoder encodeDouble:_serverTime forKey:kSubscribeBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    SubscribeBaseClass *copy = [[SubscribeBaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
