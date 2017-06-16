//
//  DiscoverDataList.m
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DiscoverDataList.h"


NSString *const kDiscoverDataListFollowedNum = @"followedNum";
NSString *const kDiscoverDataListIsSubscribe = @"isSubscribe";
NSString *const kDiscoverDataListMp3PlayUrl = @"mp3PlayUrl";
NSString *const kDiscoverDataListHost = @"host";
NSString *const kDiscoverDataListAdType = @"adType";
NSString *const kDiscoverDataListListenNum = @"listenNum";
NSString *const kDiscoverDataListRvalue = @"rvalue";
NSString *const kDiscoverDataListRtype = @"rtype";
NSString *const kDiscoverDataListAlbumName = @"albumName";
NSString *const kDiscoverDataListAlbumId = @"albumId";
NSString *const kDiscoverDataListWeburl = @"weburl";
NSString *const kDiscoverDataListRname = @"rname";
NSString *const kDiscoverDataListCornerMark = @"cornerMark";
NSString *const kDiscoverDataListPic = @"pic";
NSString *const kDiscoverDataListAdUserId = @"adUserId";
NSString *const kDiscoverDataListNum = @"num";
NSString *const kDiscoverDataListReportUrl = @"reportUrl";
NSString *const kDiscoverDataListTip = @"tip";
NSString *const kDiscoverDataListDes = @"des";
NSString *const kDiscoverDataListDataList = @"dataList";
NSString *const kDiscoverDataListArea = @"area";
NSString *const kDiscoverDataListExpoUrl = @"expoUrl";
NSString *const kDiscoverDataListAdId = @"adId";
NSString *const kDiscoverDataListRid = @"rid";
NSString *const kDiscoverDataListDataReport = @"dataReport";


@interface DiscoverDataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DiscoverDataList

@synthesize followedNum = _followedNum;
@synthesize isSubscribe = _isSubscribe;
@synthesize mp3PlayUrl = _mp3PlayUrl;
@synthesize host = _host;
@synthesize adType = _adType;
@synthesize listenNum = _listenNum;
@synthesize rvalue = _rvalue;
@synthesize rtype = _rtype;
@synthesize albumName = _albumName;
@synthesize albumId = _albumId;
@synthesize weburl = _weburl;
@synthesize rname = _rname;
@synthesize cornerMark = _cornerMark;
@synthesize pic = _pic;
@synthesize adUserId = _adUserId;
@synthesize num = _num;
@synthesize reportUrl = _reportUrl;
@synthesize tip = _tip;
@synthesize des = _des;
@synthesize dataList = _dataList;
@synthesize area = _area;
@synthesize expoUrl = _expoUrl;
@synthesize adId = _adId;
@synthesize rid = _rid;
@synthesize dataReport = _dataReport;


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
            self.followedNum = [[self objectOrNilForKey:kDiscoverDataListFollowedNum fromDictionary:dict] doubleValue];
            self.isSubscribe = [[self objectOrNilForKey:kDiscoverDataListIsSubscribe fromDictionary:dict] doubleValue];
            self.mp3PlayUrl = [self objectOrNilForKey:kDiscoverDataListMp3PlayUrl fromDictionary:dict];
            self.host = [self objectOrNilForKey:kDiscoverDataListHost fromDictionary:dict];
            self.adType = [[self objectOrNilForKey:kDiscoverDataListAdType fromDictionary:dict] doubleValue];
            self.listenNum = [[self objectOrNilForKey:kDiscoverDataListListenNum fromDictionary:dict] doubleValue];
            self.rvalue = [self objectOrNilForKey:kDiscoverDataListRvalue fromDictionary:dict];
            self.rtype = [[self objectOrNilForKey:kDiscoverDataListRtype fromDictionary:dict] doubleValue];
            self.albumName = [self objectOrNilForKey:kDiscoverDataListAlbumName fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kDiscoverDataListAlbumId fromDictionary:dict] doubleValue];
            self.weburl = [self objectOrNilForKey:kDiscoverDataListWeburl fromDictionary:dict];
            self.rname = [self objectOrNilForKey:kDiscoverDataListRname fromDictionary:dict];
            self.cornerMark = [[self objectOrNilForKey:kDiscoverDataListCornerMark fromDictionary:dict] doubleValue];
            self.pic = [self objectOrNilForKey:kDiscoverDataListPic fromDictionary:dict];
            self.adUserId = [self objectOrNilForKey:kDiscoverDataListAdUserId fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kDiscoverDataListNum fromDictionary:dict] doubleValue];
            self.reportUrl = [self objectOrNilForKey:kDiscoverDataListReportUrl fromDictionary:dict];
            self.tip = [self objectOrNilForKey:kDiscoverDataListTip fromDictionary:dict];
            self.des = [self objectOrNilForKey:kDiscoverDataListDes fromDictionary:dict];
            self.dataList = [self objectOrNilForKey:kDiscoverDataListDataList fromDictionary:dict];
            self.area = [self objectOrNilForKey:kDiscoverDataListArea fromDictionary:dict];
            self.expoUrl = [self objectOrNilForKey:kDiscoverDataListExpoUrl fromDictionary:dict];
            self.adId = [self objectOrNilForKey:kDiscoverDataListAdId fromDictionary:dict];
            self.rid = [[self objectOrNilForKey:kDiscoverDataListRid fromDictionary:dict] doubleValue];
            self.dataReport = [self objectOrNilForKey:kDiscoverDataListDataReport fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followedNum] forKey:kDiscoverDataListFollowedNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSubscribe] forKey:kDiscoverDataListIsSubscribe];
    [mutableDict setValue:self.mp3PlayUrl forKey:kDiscoverDataListMp3PlayUrl];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHost] forKey:kDiscoverDataListHost];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adType] forKey:kDiscoverDataListAdType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listenNum] forKey:kDiscoverDataListListenNum];
    [mutableDict setValue:self.rvalue forKey:kDiscoverDataListRvalue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rtype] forKey:kDiscoverDataListRtype];
    [mutableDict setValue:self.albumName forKey:kDiscoverDataListAlbumName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kDiscoverDataListAlbumId];
    [mutableDict setValue:self.weburl forKey:kDiscoverDataListWeburl];
    [mutableDict setValue:self.rname forKey:kDiscoverDataListRname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cornerMark] forKey:kDiscoverDataListCornerMark];
    [mutableDict setValue:self.pic forKey:kDiscoverDataListPic];
    [mutableDict setValue:self.adUserId forKey:kDiscoverDataListAdUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kDiscoverDataListNum];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReportUrl] forKey:kDiscoverDataListReportUrl];
    [mutableDict setValue:self.tip forKey:kDiscoverDataListTip];
    [mutableDict setValue:self.des forKey:kDiscoverDataListDes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kDiscoverDataListDataList];
    [mutableDict setValue:self.area forKey:kDiscoverDataListArea];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForExpoUrl] forKey:kDiscoverDataListExpoUrl];
    [mutableDict setValue:self.adId forKey:kDiscoverDataListAdId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kDiscoverDataListRid];
    [mutableDict setValue:self.dataReport forKey:kDiscoverDataListDataReport];

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

    self.followedNum = [aDecoder decodeDoubleForKey:kDiscoverDataListFollowedNum];
    self.isSubscribe = [aDecoder decodeDoubleForKey:kDiscoverDataListIsSubscribe];
    self.mp3PlayUrl = [aDecoder decodeObjectForKey:kDiscoverDataListMp3PlayUrl];
    self.host = [aDecoder decodeObjectForKey:kDiscoverDataListHost];
    self.adType = [aDecoder decodeDoubleForKey:kDiscoverDataListAdType];
    self.listenNum = [aDecoder decodeDoubleForKey:kDiscoverDataListListenNum];
    self.rvalue = [aDecoder decodeObjectForKey:kDiscoverDataListRvalue];
    self.rtype = [aDecoder decodeDoubleForKey:kDiscoverDataListRtype];
    self.albumName = [aDecoder decodeObjectForKey:kDiscoverDataListAlbumName];
    self.albumId = [aDecoder decodeDoubleForKey:kDiscoverDataListAlbumId];
    self.weburl = [aDecoder decodeObjectForKey:kDiscoverDataListWeburl];
    self.rname = [aDecoder decodeObjectForKey:kDiscoverDataListRname];
    self.cornerMark = [aDecoder decodeDoubleForKey:kDiscoverDataListCornerMark];
    self.pic = [aDecoder decodeObjectForKey:kDiscoverDataListPic];
    self.adUserId = [aDecoder decodeObjectForKey:kDiscoverDataListAdUserId];
    self.num = [aDecoder decodeDoubleForKey:kDiscoverDataListNum];
    self.reportUrl = [aDecoder decodeObjectForKey:kDiscoverDataListReportUrl];
    self.tip = [aDecoder decodeObjectForKey:kDiscoverDataListTip];
    self.des = [aDecoder decodeObjectForKey:kDiscoverDataListDes];
    self.dataList = [aDecoder decodeObjectForKey:kDiscoverDataListDataList];
    self.area = [aDecoder decodeObjectForKey:kDiscoverDataListArea];
    self.expoUrl = [aDecoder decodeObjectForKey:kDiscoverDataListExpoUrl];
    self.adId = [aDecoder decodeObjectForKey:kDiscoverDataListAdId];
    self.rid = [aDecoder decodeDoubleForKey:kDiscoverDataListRid];
    self.dataReport = [aDecoder decodeObjectForKey:kDiscoverDataListDataReport];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_followedNum forKey:kDiscoverDataListFollowedNum];
    [aCoder encodeDouble:_isSubscribe forKey:kDiscoverDataListIsSubscribe];
    [aCoder encodeObject:_mp3PlayUrl forKey:kDiscoverDataListMp3PlayUrl];
    [aCoder encodeObject:_host forKey:kDiscoverDataListHost];
    [aCoder encodeDouble:_adType forKey:kDiscoverDataListAdType];
    [aCoder encodeDouble:_listenNum forKey:kDiscoverDataListListenNum];
    [aCoder encodeObject:_rvalue forKey:kDiscoverDataListRvalue];
    [aCoder encodeDouble:_rtype forKey:kDiscoverDataListRtype];
    [aCoder encodeObject:_albumName forKey:kDiscoverDataListAlbumName];
    [aCoder encodeDouble:_albumId forKey:kDiscoverDataListAlbumId];
    [aCoder encodeObject:_weburl forKey:kDiscoverDataListWeburl];
    [aCoder encodeObject:_rname forKey:kDiscoverDataListRname];
    [aCoder encodeDouble:_cornerMark forKey:kDiscoverDataListCornerMark];
    [aCoder encodeObject:_pic forKey:kDiscoverDataListPic];
    [aCoder encodeObject:_adUserId forKey:kDiscoverDataListAdUserId];
    [aCoder encodeDouble:_num forKey:kDiscoverDataListNum];
    [aCoder encodeObject:_reportUrl forKey:kDiscoverDataListReportUrl];
    [aCoder encodeObject:_tip forKey:kDiscoverDataListTip];
    [aCoder encodeObject:_des forKey:kDiscoverDataListDes];
    [aCoder encodeObject:_dataList forKey:kDiscoverDataListDataList];
    [aCoder encodeObject:_area forKey:kDiscoverDataListArea];
    [aCoder encodeObject:_expoUrl forKey:kDiscoverDataListExpoUrl];
    [aCoder encodeObject:_adId forKey:kDiscoverDataListAdId];
    [aCoder encodeDouble:_rid forKey:kDiscoverDataListRid];
    [aCoder encodeObject:_dataReport forKey:kDiscoverDataListDataReport];
}

- (id)copyWithZone:(NSZone *)zone
{
    DiscoverDataList *copy = [[DiscoverDataList alloc] init];
    
    if (copy) {

        copy.followedNum = self.followedNum;
        copy.isSubscribe = self.isSubscribe;
        copy.mp3PlayUrl = [self.mp3PlayUrl copyWithZone:zone];
        copy.host = [self.host copyWithZone:zone];
        copy.adType = self.adType;
        copy.listenNum = self.listenNum;
        copy.rvalue = [self.rvalue copyWithZone:zone];
        copy.rtype = self.rtype;
        copy.albumName = [self.albumName copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.weburl = [self.weburl copyWithZone:zone];
        copy.rname = [self.rname copyWithZone:zone];
        copy.cornerMark = self.cornerMark;
        copy.pic = [self.pic copyWithZone:zone];
        copy.adUserId = [self.adUserId copyWithZone:zone];
        copy.num = self.num;
        copy.reportUrl = [self.reportUrl copyWithZone:zone];
        copy.tip = [self.tip copyWithZone:zone];
        copy.des = [self.des copyWithZone:zone];
        copy.dataList = [self.dataList copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.expoUrl = [self.expoUrl copyWithZone:zone];
        copy.adId = [self.adId copyWithZone:zone];
        copy.rid = self.rid;
        copy.dataReport = [self.dataReport copyWithZone:zone];
    }
    
    return copy;
}


@end
