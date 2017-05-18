//
//  SelectionBaseClass.m
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SelectionBaseClass.h"
#import "SelectionResult.h"


NSString *const kSelectionBaseClassResult = @"result";
NSString *const kSelectionBaseClassMessage = @"message";
NSString *const kSelectionBaseClassCode = @"code";
NSString *const kSelectionBaseClassServerTime = @"serverTime";


@interface SelectionBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SelectionBaseClass

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
            self.result = [SelectionResult modelObjectWithDictionary:[dict objectForKey:kSelectionBaseClassResult]];
            self.message = [self objectOrNilForKey:kSelectionBaseClassMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kSelectionBaseClassCode fromDictionary:dict];
            self.serverTime = [[self objectOrNilForKey:kSelectionBaseClassServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kSelectionBaseClassResult];
    [mutableDict setValue:self.message forKey:kSelectionBaseClassMessage];
    [mutableDict setValue:self.code forKey:kSelectionBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kSelectionBaseClassServerTime];

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

    self.result = [aDecoder decodeObjectForKey:kSelectionBaseClassResult];
    self.message = [aDecoder decodeObjectForKey:kSelectionBaseClassMessage];
    self.code = [aDecoder decodeObjectForKey:kSelectionBaseClassCode];
    self.serverTime = [aDecoder decodeDoubleForKey:kSelectionBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_result forKey:kSelectionBaseClassResult];
    [aCoder encodeObject:_message forKey:kSelectionBaseClassMessage];
    [aCoder encodeObject:_code forKey:kSelectionBaseClassCode];
    [aCoder encodeDouble:_serverTime forKey:kSelectionBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    SelectionBaseClass *copy = [[SelectionBaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
