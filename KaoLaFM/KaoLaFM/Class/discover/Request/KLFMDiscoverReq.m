
//
//  KLFMDiscoverReq.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/16.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "KLFMDiscoverReq.h"

@implementation KLFMDiscoverReq

+ (NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"labelid"] = @"383";
    params[@"pageid"] = @"109";
    params[@"installid"] = @"00045Wbz";
    params[@"appid"] = @"0";
    params[@"operator"] = @"2";
    
    params[@"playid"] = @"";
    params[@"suppermode"] = @"iPhone 5S";
    params[@"lon"] = @"0";
    params[@"channel"] = @"appstore";
    
    params[@"action"] = @"327";
    params[@"resoultion"] = @"640*1136";
    params[@"version"] = @"5.0.1";
    params[@"udid"] = @"c745ba1600113a490b78d8e32db7a697";
    
    params[@"usertype"] = @"0";
    params[@"sign"] = @"6a46099432f86632c7b7e0650eb1f97d";
    params[@"mac"] = @"020000000000";
    params[@"uid"] = @"";
    
    params[@"timestamp"] = [HelperTools HTtimeStamp];
    params[@"sessionid"] = @"6E7A61EE1628417AA4F47D82D4EBCB7A";
    params[@"timezone"] = @"28800";
    params[@"network"] = @"1";
    
    params[@"osversion"] = @"10.3.1";
    params[@"lat"] = @"31.079735";
    params[@"idfv"] = @"6455182E-BE25-4EE5-92ED-DF9BA8F14466";
    params[@"page"] = @"200014";
    
    params[@"producer"] = @"apple";
    params[@"screensize"] = @"320*568";
    params[@"idfa"] = @"9DA9FB1F-39FB-47C4-A7C3-A2B3698253BF";
    
    return params;
}

@end
