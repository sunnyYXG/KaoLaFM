//
//  CategoryDataList.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CategoryDataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double parentId;
@property (nonatomic, strong) NSString *backgroundPic;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSString *titleColor;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double label;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *parentCategoryName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
