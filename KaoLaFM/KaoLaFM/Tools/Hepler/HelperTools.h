//
//  HelperTools.h
//  CNTaiPingEhome
//
//  Created by rongyun on 16/11/2.
//  Copyright © 2016年 cntaiping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperTools : NSObject
+ (void)setTextColor:(UILabel *)label AndRange:(NSRange)range AndColor:(UIColor *)vaColor;

+ (CGRect)height:(UILabel *)label frame:(CGRect)frame;

+ (void)setTextColor:(UILabel *)label AndRange:(NSRange)range AndColor:(UIColor *)vaColor AndFont:(CGFloat)font;

/** 时间戳 */
+ (NSString *)HTtimeStamp;

+ (NSString *)stringWith_int:(NSInteger)integer;
@end
