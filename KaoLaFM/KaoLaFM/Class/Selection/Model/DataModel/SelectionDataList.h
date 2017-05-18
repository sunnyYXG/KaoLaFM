//
//  SelectionDataList.h
//
//  Created by   on 17/5/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SelectionDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *host;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) double dataListIdentifier;
@property (nonatomic, assign) double isSubscribe;
@property (nonatomic, strong) NSString *tip;
@property (nonatomic, strong) NSArray *reportUrl;
@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *albumName;
@property (nonatomic, assign) double cornerMark;
@property (nonatomic, strong) NSString *relatedValue;
@property (nonatomic, assign) double contentType;
@property (nonatomic, strong) NSString *dataReport;
@property (nonatomic, assign) id area;
@property (nonatomic, assign) double adType;
@property (nonatomic, assign) double listenNum;
@property (nonatomic, assign) double followedNum;
@property (nonatomic, assign) double rtype;
@property (nonatomic, strong) NSString *weburl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSString *adId;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *adUserId;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) double hasmore;
@property (nonatomic, strong) NSString *rname;
@property (nonatomic, assign) double rid;
@property (nonatomic, assign) double componentType;
@property (nonatomic, assign) double moreType;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, assign) double contentSourceId;
@property (nonatomic, strong) NSString *mp3PlayUrl;
@property (nonatomic, strong) NSString *rvalue;
@property (nonatomic, strong) NSArray *expoUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
