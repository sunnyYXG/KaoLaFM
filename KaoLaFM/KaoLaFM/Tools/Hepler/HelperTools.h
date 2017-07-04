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

+ (NSValue *)withFrame:(CGRect)frame;
+ (CGRect)withNSValue:(NSValue *)value;

+ (NSString *) isBlankString:(NSString *)string;

+ (NSArray *)rectWithCreateUIWithLeft:(CGFloat)left top:(CGFloat)top num:(NSInteger)n width:(CGFloat)w height:(CGFloat)h Vertical:(CGFloat)vBottom Horizontal:(CGFloat)hBottom  arr:(NSArray *)arr;

+ (float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

+ (void)playID:(NSString *)playID object:(NSDictionary *)object;
@end
