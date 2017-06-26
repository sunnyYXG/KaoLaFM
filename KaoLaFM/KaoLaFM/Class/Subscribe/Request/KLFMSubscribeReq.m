//
//  KLFMSubscribeReq.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/26.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "KLFMSubscribeReq.h"

@implementation KLFMSubscribeReq

+ (NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"pagenum"] = @"1";
    params[@"pagesize"] = @"50";

    params[@"installid"] = @"000472M2";
    params[@"appid"] = @"0";
    params[@"operator"] = @"2";
    
    params[@"playid"] = @"";
    params[@"suppermode"] = @"0";
    params[@"devicename"] = @"iPhone 5s";
    params[@"lon"] = @"121.511201";
    params[@"lat"] = @"31.079735";
    params[@"channel"] = @"appstore";
    
    params[@"action"] = @"1627";
    params[@"resoultion"] = @"640*1136";
    params[@"version"] = @"5.0.2";
    params[@"udid"] = @"c745ba1600113a490b78d8e32db7a697";
    
    params[@"usertype"] = @"0";
    params[@"sign"] = @"6a46099432f86632c7b7e0650eb1f97d";
    params[@"mac"] = @"020000000000";
    params[@"uid"] = @"";
    
    params[@"timestamp"] = [HelperTools HTtimeStamp];
    params[@"sessionid"] = @"8C7E3186FE04410A8B0D234AFC82A286";
    params[@"timezone"] = @"28800";
    params[@"network"] = @"1";
    
    params[@"osversion"] = @"10.3.2";
    params[@"idfv"] = @"F2168C1E-0D17-43D8-A734-881F28E6358F";
    params[@"page"] = @"200033";
    
    params[@"producer"] = @"apple";
    params[@"screensize"] = @"320*568";
    params[@"idfa"] = @"9DA9FB1F-39FB-47C4-A7C3-A2B3698253BF";
    
    return params;
}

@end
