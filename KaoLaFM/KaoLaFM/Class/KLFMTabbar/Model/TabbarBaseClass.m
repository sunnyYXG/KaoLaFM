//
//  TabbarBaseClass.m
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "TabbarBaseClass.h"
#import "TabbarResult.h"


NSString *const kTabbarBaseClassResult = @"result";
NSString *const kTabbarBaseClassMessage = @"message";
NSString *const kTabbarBaseClassCode = @"code";
NSString *const kTabbarBaseClassServerTime = @"serverTime";


@interface TabbarBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TabbarBaseClass

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
            self.result = [TabbarResult modelObjectWithDictionary:[dict objectForKey:kTabbarBaseClassResult]];
            self.message = [self objectOrNilForKey:kTabbarBaseClassMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kTabbarBaseClassCode fromDictionary:dict];
            self.serverTime = [[self objectOrNilForKey:kTabbarBaseClassServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kTabbarBaseClassResult];
    [mutableDict setValue:self.message forKey:kTabbarBaseClassMessage];
    [mutableDict setValue:self.code forKey:kTabbarBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kTabbarBaseClassServerTime];

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

    self.result = [aDecoder decodeObjectForKey:kTabbarBaseClassResult];
    self.message = [aDecoder decodeObjectForKey:kTabbarBaseClassMessage];
    self.code = [aDecoder decodeObjectForKey:kTabbarBaseClassCode];
    self.serverTime = [aDecoder decodeDoubleForKey:kTabbarBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kTabbarBaseClassResult];
    [aCoder encodeObject:_message forKey:kTabbarBaseClassMessage];
    [aCoder encodeObject:_code forKey:kTabbarBaseClassCode];
    [aCoder encodeDouble:_serverTime forKey:kTabbarBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    TabbarBaseClass *copy = [[TabbarBaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
