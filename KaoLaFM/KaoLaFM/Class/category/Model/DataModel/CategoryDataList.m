//
//  CategoryDataList.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryDataList.h"


NSString *const kCategoryDataListParentId = @"parentId";
NSString *const kCategoryDataListBackgroundPic = @"backgroundPic";
NSString *const kCategoryDataListDataList = @"dataList";
NSString *const kCategoryDataListTitleColor = @"titleColor";
NSString *const kCategoryDataListTitle = @"title";
NSString *const kCategoryDataListCategoryId = @"categoryId";
NSString *const kCategoryDataListLabel = @"label";
NSString *const kCategoryDataListType = @"type";
NSString *const kCategoryDataListIcon = @"icon";
NSString *const kCategoryDataListParentCategoryName = @"parentCategoryName";


@interface CategoryDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryDataList

@synthesize parentId = _parentId;
@synthesize backgroundPic = _backgroundPic;
@synthesize dataList = _dataList;
@synthesize titleColor = _titleColor;
@synthesize title = _title;
@synthesize categoryId = _categoryId;
@synthesize label = _label;
@synthesize type = _type;
@synthesize icon = _icon;
@synthesize parentCategoryName = _parentCategoryName;


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
            self.parentId = [[self objectOrNilForKey:kCategoryDataListParentId fromDictionary:dict] doubleValue];
            self.backgroundPic = [self objectOrNilForKey:kCategoryDataListBackgroundPic fromDictionary:dict];
            self.dataList = [self objectOrNilForKey:kCategoryDataListDataList fromDictionary:dict];
            self.titleColor = [self objectOrNilForKey:kCategoryDataListTitleColor fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCategoryDataListTitle fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kCategoryDataListCategoryId fromDictionary:dict] doubleValue];
            self.label = [[self objectOrNilForKey:kCategoryDataListLabel fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kCategoryDataListType fromDictionary:dict] doubleValue];
            self.icon = [self objectOrNilForKey:kCategoryDataListIcon fromDictionary:dict];
            self.parentCategoryName = [self objectOrNilForKey:kCategoryDataListParentCategoryName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kCategoryDataListParentId];
    [mutableDict setValue:self.backgroundPic forKey:kCategoryDataListBackgroundPic];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kCategoryDataListDataList];
    [mutableDict setValue:self.titleColor forKey:kCategoryDataListTitleColor];
    [mutableDict setValue:self.title forKey:kCategoryDataListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kCategoryDataListCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.label] forKey:kCategoryDataListLabel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kCategoryDataListType];
    [mutableDict setValue:self.icon forKey:kCategoryDataListIcon];
    [mutableDict setValue:self.parentCategoryName forKey:kCategoryDataListParentCategoryName];

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

    self.parentId = [aDecoder decodeDoubleForKey:kCategoryDataListParentId];
    self.backgroundPic = [aDecoder decodeObjectForKey:kCategoryDataListBackgroundPic];
    self.dataList = [aDecoder decodeObjectForKey:kCategoryDataListDataList];
    self.titleColor = [aDecoder decodeObjectForKey:kCategoryDataListTitleColor];
    self.title = [aDecoder decodeObjectForKey:kCategoryDataListTitle];
    self.categoryId = [aDecoder decodeDoubleForKey:kCategoryDataListCategoryId];
    self.label = [aDecoder decodeDoubleForKey:kCategoryDataListLabel];
    self.type = [aDecoder decodeDoubleForKey:kCategoryDataListType];
    self.icon = [aDecoder decodeObjectForKey:kCategoryDataListIcon];
    self.parentCategoryName = [aDecoder decodeObjectForKey:kCategoryDataListParentCategoryName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_parentId forKey:kCategoryDataListParentId];
    [aCoder encodeObject:_backgroundPic forKey:kCategoryDataListBackgroundPic];
    [aCoder encodeObject:_dataList forKey:kCategoryDataListDataList];
    [aCoder encodeObject:_titleColor forKey:kCategoryDataListTitleColor];
    [aCoder encodeObject:_title forKey:kCategoryDataListTitle];
    [aCoder encodeDouble:_categoryId forKey:kCategoryDataListCategoryId];
    [aCoder encodeDouble:_label forKey:kCategoryDataListLabel];
    [aCoder encodeDouble:_type forKey:kCategoryDataListType];
    [aCoder encodeObject:_icon forKey:kCategoryDataListIcon];
    [aCoder encodeObject:_parentCategoryName forKey:kCategoryDataListParentCategoryName];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryDataList *copy = [[CategoryDataList alloc] init];
    
    if (copy) {

        copy.parentId = self.parentId;
        copy.backgroundPic = [self.backgroundPic copyWithZone:zone];
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.titleColor = [self.titleColor copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.label = self.label;
        copy.type = self.type;
        copy.icon = [self.icon copyWithZone:zone];
        copy.parentCategoryName = [self.parentCategoryName copyWithZone:zone];
    }
    
    return copy;
}


@end
