//
//  SelectionDataList.m
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SelectionDataList.h"


NSString *const kSelectionDataListHost = @"host";
NSString *const kSelectionDataListIcon = @"icon";
NSString *const kSelectionDataListId = @"id";
NSString *const kSelectionDataListIsSubscribe = @"isSubscribe";
NSString *const kSelectionDataListTip = @"tip";
NSString *const kSelectionDataListReportUrl = @"reportUrl";
NSString *const kSelectionDataListNum = @"num";
NSString *const kSelectionDataListAlbumName = @"albumName";
NSString *const kSelectionDataListCornerMark = @"cornerMark";
NSString *const kSelectionDataListRelatedValue = @"relatedValue";
NSString *const kSelectionDataListContentType = @"contentType";
NSString *const kSelectionDataListDataReport = @"dataReport";
NSString *const kSelectionDataListArea = @"area";
NSString *const kSelectionDataListAdType = @"adType";
NSString *const kSelectionDataListListenNum = @"listenNum";
NSString *const kSelectionDataListFollowedNum = @"followedNum";
NSString *const kSelectionDataListRtype = @"rtype";
NSString *const kSelectionDataListWeburl = @"weburl";
NSString *const kSelectionDataListName = @"name";
NSString *const kSelectionDataListDataList = @"dataList";
NSString *const kSelectionDataListAdId = @"adId";
NSString *const kSelectionDataListCount = @"count";
NSString *const kSelectionDataListAdUserId = @"adUserId";
NSString *const kSelectionDataListDes = @"des";
NSString *const kSelectionDataListAlbumId = @"albumId";
NSString *const kSelectionDataListDesc = @"desc";
NSString *const kSelectionDataListHasmore = @"hasmore";
NSString *const kSelectionDataListRname = @"rname";
NSString *const kSelectionDataListRid = @"rid";
NSString *const kSelectionDataListComponentType = @"componentType";
NSString *const kSelectionDataListMoreType = @"moreType";
NSString *const kSelectionDataListPic = @"pic";
NSString *const kSelectionDataListContentSourceId = @"contentSourceId";
NSString *const kSelectionDataListMp3PlayUrl = @"mp3PlayUrl";
NSString *const kSelectionDataListRvalue = @"rvalue";
NSString *const kSelectionDataListExpoUrl = @"expoUrl";


@interface SelectionDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SelectionDataList

@synthesize host = _host;
@synthesize icon = _icon;
@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize isSubscribe = _isSubscribe;
@synthesize tip = _tip;
@synthesize reportUrl = _reportUrl;
@synthesize num = _num;
@synthesize albumName = _albumName;
@synthesize cornerMark = _cornerMark;
@synthesize relatedValue = _relatedValue;
@synthesize contentType = _contentType;
@synthesize dataReport = _dataReport;
@synthesize area = _area;
@synthesize adType = _adType;
@synthesize listenNum = _listenNum;
@synthesize followedNum = _followedNum;
@synthesize rtype = _rtype;
@synthesize weburl = _weburl;
@synthesize name = _name;
@synthesize dataList = _dataList;
@synthesize adId = _adId;
@synthesize count = _count;
@synthesize adUserId = _adUserId;
@synthesize des = _des;
@synthesize albumId = _albumId;
@synthesize desc = _desc;
@synthesize hasmore = _hasmore;
@synthesize rname = _rname;
@synthesize rid = _rid;
@synthesize componentType = _componentType;
@synthesize moreType = _moreType;
@synthesize pic = _pic;
@synthesize contentSourceId = _contentSourceId;
@synthesize mp3PlayUrl = _mp3PlayUrl;
@synthesize rvalue = _rvalue;
@synthesize expoUrl = _expoUrl;


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
            self.host = [self objectOrNilForKey:kSelectionDataListHost fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kSelectionDataListIcon fromDictionary:dict];
            self.dataListIdentifier = [[self objectOrNilForKey:kSelectionDataListId fromDictionary:dict] doubleValue];
            self.isSubscribe = [[self objectOrNilForKey:kSelectionDataListIsSubscribe fromDictionary:dict] doubleValue];
            self.tip = [self objectOrNilForKey:kSelectionDataListTip fromDictionary:dict];
            self.reportUrl = [self objectOrNilForKey:kSelectionDataListReportUrl fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kSelectionDataListNum fromDictionary:dict] doubleValue];
            self.albumName = [self objectOrNilForKey:kSelectionDataListAlbumName fromDictionary:dict];
            self.cornerMark = [[self objectOrNilForKey:kSelectionDataListCornerMark fromDictionary:dict] doubleValue];
            self.relatedValue = [self objectOrNilForKey:kSelectionDataListRelatedValue fromDictionary:dict];
            self.contentType = [[self objectOrNilForKey:kSelectionDataListContentType fromDictionary:dict] doubleValue];
            self.dataReport = [self objectOrNilForKey:kSelectionDataListDataReport fromDictionary:dict];
            self.area = [self objectOrNilForKey:kSelectionDataListArea fromDictionary:dict];
            self.adType = [[self objectOrNilForKey:kSelectionDataListAdType fromDictionary:dict] doubleValue];
            self.listenNum = [[self objectOrNilForKey:kSelectionDataListListenNum fromDictionary:dict] doubleValue];
            self.followedNum = [[self objectOrNilForKey:kSelectionDataListFollowedNum fromDictionary:dict] doubleValue];
            self.rtype = [[self objectOrNilForKey:kSelectionDataListRtype fromDictionary:dict] doubleValue];
            self.weburl = [self objectOrNilForKey:kSelectionDataListWeburl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kSelectionDataListName fromDictionary:dict];
            self.dataList = [self objectOrNilForKey:kSelectionDataListDataList fromDictionary:dict];
            self.adId = [self objectOrNilForKey:kSelectionDataListAdId fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kSelectionDataListCount fromDictionary:dict] doubleValue];
            self.adUserId = [self objectOrNilForKey:kSelectionDataListAdUserId fromDictionary:dict];
            self.des = [self objectOrNilForKey:kSelectionDataListDes fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kSelectionDataListAlbumId fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kSelectionDataListDesc fromDictionary:dict];
            self.hasmore = [[self objectOrNilForKey:kSelectionDataListHasmore fromDictionary:dict] doubleValue];
            self.rname = [self objectOrNilForKey:kSelectionDataListRname fromDictionary:dict];
            self.rid = [[self objectOrNilForKey:kSelectionDataListRid fromDictionary:dict] doubleValue];
            self.componentType = [[self objectOrNilForKey:kSelectionDataListComponentType fromDictionary:dict] doubleValue];
            self.moreType = [[self objectOrNilForKey:kSelectionDataListMoreType fromDictionary:dict] doubleValue];
            self.pic = [self objectOrNilForKey:kSelectionDataListPic fromDictionary:dict];
            self.contentSourceId = [[self objectOrNilForKey:kSelectionDataListContentSourceId fromDictionary:dict] doubleValue];
            self.mp3PlayUrl = [self objectOrNilForKey:kSelectionDataListMp3PlayUrl fromDictionary:dict];
            self.rvalue = [self objectOrNilForKey:kSelectionDataListRvalue fromDictionary:dict];
            self.expoUrl = [self objectOrNilForKey:kSelectionDataListExpoUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHost = [NSMutableArray array];
    for (NSObject *subArrayObject in self.host) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHost addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHost addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHost] forKey:kSelectionDataListHost];
    [mutableDict setValue:self.icon forKey:kSelectionDataListIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kSelectionDataListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSubscribe] forKey:kSelectionDataListIsSubscribe];
    [mutableDict setValue:self.tip forKey:kSelectionDataListTip];
    NSMutableArray *tempArrayForReportUrl = [NSMutableArray array];
    for (NSObject *subArrayObject in self.reportUrl) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReportUrl addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReportUrl addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReportUrl] forKey:kSelectionDataListReportUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kSelectionDataListNum];
    [mutableDict setValue:self.albumName forKey:kSelectionDataListAlbumName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cornerMark] forKey:kSelectionDataListCornerMark];
    [mutableDict setValue:self.relatedValue forKey:kSelectionDataListRelatedValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentType] forKey:kSelectionDataListContentType];
    [mutableDict setValue:self.dataReport forKey:kSelectionDataListDataReport];
    [mutableDict setValue:self.area forKey:kSelectionDataListArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adType] forKey:kSelectionDataListAdType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listenNum] forKey:kSelectionDataListListenNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followedNum] forKey:kSelectionDataListFollowedNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rtype] forKey:kSelectionDataListRtype];
    [mutableDict setValue:self.weburl forKey:kSelectionDataListWeburl];
    [mutableDict setValue:self.name forKey:kSelectionDataListName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kSelectionDataListDataList];
    [mutableDict setValue:self.adId forKey:kSelectionDataListAdId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kSelectionDataListCount];
    [mutableDict setValue:self.adUserId forKey:kSelectionDataListAdUserId];
    [mutableDict setValue:self.des forKey:kSelectionDataListDes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kSelectionDataListAlbumId];
    [mutableDict setValue:self.desc forKey:kSelectionDataListDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasmore] forKey:kSelectionDataListHasmore];
    [mutableDict setValue:self.rname forKey:kSelectionDataListRname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kSelectionDataListRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.componentType] forKey:kSelectionDataListComponentType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.moreType] forKey:kSelectionDataListMoreType];
    [mutableDict setValue:self.pic forKey:kSelectionDataListPic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contentSourceId] forKey:kSelectionDataListContentSourceId];
    [mutableDict setValue:self.mp3PlayUrl forKey:kSelectionDataListMp3PlayUrl];
    [mutableDict setValue:self.rvalue forKey:kSelectionDataListRvalue];
    NSMutableArray *tempArrayForExpoUrl = [NSMutableArray array];
    for (NSObject *subArrayObject in self.expoUrl) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForExpoUrl addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForExpoUrl addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForExpoUrl] forKey:kSelectionDataListExpoUrl];

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

    self.host = [aDecoder decodeObjectForKey:kSelectionDataListHost];
    self.icon = [aDecoder decodeObjectForKey:kSelectionDataListIcon];
    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kSelectionDataListId];
    self.isSubscribe = [aDecoder decodeDoubleForKey:kSelectionDataListIsSubscribe];
    self.tip = [aDecoder decodeObjectForKey:kSelectionDataListTip];
    self.reportUrl = [aDecoder decodeObjectForKey:kSelectionDataListReportUrl];
    self.num = [aDecoder decodeDoubleForKey:kSelectionDataListNum];
    self.albumName = [aDecoder decodeObjectForKey:kSelectionDataListAlbumName];
    self.cornerMark = [aDecoder decodeDoubleForKey:kSelectionDataListCornerMark];
    self.relatedValue = [aDecoder decodeObjectForKey:kSelectionDataListRelatedValue];
    self.contentType = [aDecoder decodeDoubleForKey:kSelectionDataListContentType];
    self.dataReport = [aDecoder decodeObjectForKey:kSelectionDataListDataReport];
    self.area = [aDecoder decodeObjectForKey:kSelectionDataListArea];
    self.adType = [aDecoder decodeDoubleForKey:kSelectionDataListAdType];
    self.listenNum = [aDecoder decodeDoubleForKey:kSelectionDataListListenNum];
    self.followedNum = [aDecoder decodeDoubleForKey:kSelectionDataListFollowedNum];
    self.rtype = [aDecoder decodeDoubleForKey:kSelectionDataListRtype];
    self.weburl = [aDecoder decodeObjectForKey:kSelectionDataListWeburl];
    self.name = [aDecoder decodeObjectForKey:kSelectionDataListName];
    self.dataList = [aDecoder decodeObjectForKey:kSelectionDataListDataList];
    self.adId = [aDecoder decodeObjectForKey:kSelectionDataListAdId];
    self.count = [aDecoder decodeDoubleForKey:kSelectionDataListCount];
    self.adUserId = [aDecoder decodeObjectForKey:kSelectionDataListAdUserId];
    self.des = [aDecoder decodeObjectForKey:kSelectionDataListDes];
    self.albumId = [aDecoder decodeDoubleForKey:kSelectionDataListAlbumId];
    self.desc = [aDecoder decodeObjectForKey:kSelectionDataListDesc];
    self.hasmore = [aDecoder decodeDoubleForKey:kSelectionDataListHasmore];
    self.rname = [aDecoder decodeObjectForKey:kSelectionDataListRname];
    self.rid = [aDecoder decodeDoubleForKey:kSelectionDataListRid];
    self.componentType = [aDecoder decodeDoubleForKey:kSelectionDataListComponentType];
    self.moreType = [aDecoder decodeDoubleForKey:kSelectionDataListMoreType];
    self.pic = [aDecoder decodeObjectForKey:kSelectionDataListPic];
    self.contentSourceId = [aDecoder decodeDoubleForKey:kSelectionDataListContentSourceId];
    self.mp3PlayUrl = [aDecoder decodeObjectForKey:kSelectionDataListMp3PlayUrl];
    self.rvalue = [aDecoder decodeObjectForKey:kSelectionDataListRvalue];
    self.expoUrl = [aDecoder decodeObjectForKey:kSelectionDataListExpoUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_host forKey:kSelectionDataListHost];
    [aCoder encodeObject:_icon forKey:kSelectionDataListIcon];
    [aCoder encodeDouble:_dataListIdentifier forKey:kSelectionDataListId];
    [aCoder encodeDouble:_isSubscribe forKey:kSelectionDataListIsSubscribe];
    [aCoder encodeObject:_tip forKey:kSelectionDataListTip];
    [aCoder encodeObject:_reportUrl forKey:kSelectionDataListReportUrl];
    [aCoder encodeDouble:_num forKey:kSelectionDataListNum];
    [aCoder encodeObject:_albumName forKey:kSelectionDataListAlbumName];
    [aCoder encodeDouble:_cornerMark forKey:kSelectionDataListCornerMark];
    [aCoder encodeObject:_relatedValue forKey:kSelectionDataListRelatedValue];
    [aCoder encodeDouble:_contentType forKey:kSelectionDataListContentType];
    [aCoder encodeObject:_dataReport forKey:kSelectionDataListDataReport];
    [aCoder encodeObject:_area forKey:kSelectionDataListArea];
    [aCoder encodeDouble:_adType forKey:kSelectionDataListAdType];
    [aCoder encodeDouble:_listenNum forKey:kSelectionDataListListenNum];
    [aCoder encodeDouble:_followedNum forKey:kSelectionDataListFollowedNum];
    [aCoder encodeDouble:_rtype forKey:kSelectionDataListRtype];
    [aCoder encodeObject:_weburl forKey:kSelectionDataListWeburl];
    [aCoder encodeObject:_name forKey:kSelectionDataListName];
    [aCoder encodeObject:_dataList forKey:kSelectionDataListDataList];
    [aCoder encodeObject:_adId forKey:kSelectionDataListAdId];
    [aCoder encodeDouble:_count forKey:kSelectionDataListCount];
    [aCoder encodeObject:_adUserId forKey:kSelectionDataListAdUserId];
    [aCoder encodeObject:_des forKey:kSelectionDataListDes];
    [aCoder encodeDouble:_albumId forKey:kSelectionDataListAlbumId];
    [aCoder encodeObject:_desc forKey:kSelectionDataListDesc];
    [aCoder encodeDouble:_hasmore forKey:kSelectionDataListHasmore];
    [aCoder encodeObject:_rname forKey:kSelectionDataListRname];
    [aCoder encodeDouble:_rid forKey:kSelectionDataListRid];
    [aCoder encodeDouble:_componentType forKey:kSelectionDataListComponentType];
    [aCoder encodeDouble:_moreType forKey:kSelectionDataListMoreType];
    [aCoder encodeObject:_pic forKey:kSelectionDataListPic];
    [aCoder encodeDouble:_contentSourceId forKey:kSelectionDataListContentSourceId];
    [aCoder encodeObject:_mp3PlayUrl forKey:kSelectionDataListMp3PlayUrl];
    [aCoder encodeObject:_rvalue forKey:kSelectionDataListRvalue];
    [aCoder encodeObject:_expoUrl forKey:kSelectionDataListExpoUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SelectionDataList *copy = [[SelectionDataList alloc] init];
    
    if (copy) {

        copy.host = [self.host copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.dataListIdentifier = self.dataListIdentifier;
        copy.isSubscribe = self.isSubscribe;
        copy.tip = [self.tip copyWithZone:zone];
        copy.reportUrl = [self.reportUrl copyWithZone:zone];
        copy.num = self.num;
        copy.albumName = [self.albumName copyWithZone:zone];
        copy.cornerMark = self.cornerMark;
        copy.relatedValue = [self.relatedValue copyWithZone:zone];
        copy.contentType = self.contentType;
        copy.dataReport = [self.dataReport copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.adType = self.adType;
        copy.listenNum = self.listenNum;
        copy.followedNum = self.followedNum;
        copy.rtype = self.rtype;
        copy.weburl = [self.weburl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.adId = [self.adId copyWithZone:zone];
        copy.count = self.count;
        copy.adUserId = [self.adUserId copyWithZone:zone];
        copy.des = [self.des copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.desc = [self.desc copyWithZone:zone];
        copy.hasmore = self.hasmore;
        copy.rname = [self.rname copyWithZone:zone];
        copy.rid = self.rid;
        copy.componentType = self.componentType;
        copy.moreType = self.moreType;
        copy.pic = [self.pic copyWithZone:zone];
        copy.contentSourceId = self.contentSourceId;
        copy.mp3PlayUrl = [self.mp3PlayUrl copyWithZone:zone];
        copy.rvalue = [self.rvalue copyWithZone:zone];
        copy.expoUrl = [self.expoUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
