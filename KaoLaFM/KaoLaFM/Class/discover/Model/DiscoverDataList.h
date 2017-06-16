//
//  DiscoverDataList.h
//
//  Created by rongyun  on 2017/6/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DiscoverDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double followedNum;
@property (nonatomic, assign) double isSubscribe;
@property (nonatomic, strong) NSString *mp3PlayUrl;
@property (nonatomic, strong) NSArray *host;
@property (nonatomic, assign) double adType;
@property (nonatomic, assign) double listenNum;
@property (nonatomic, strong) NSString *rvalue;
@property (nonatomic, assign) double rtype;
@property (nonatomic, strong) NSString *albumName;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *weburl;
@property (nonatomic, strong) NSString *rname;
@property (nonatomic, assign) double cornerMark;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *adUserId;
@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSArray *reportUrl;
@property (nonatomic, strong) NSString *tip;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, assign) id area;
@property (nonatomic, strong) NSArray *expoUrl;
@property (nonatomic, strong) NSString *adId;
@property (nonatomic, assign) double rid;
@property (nonatomic, strong) NSString *dataReport;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
