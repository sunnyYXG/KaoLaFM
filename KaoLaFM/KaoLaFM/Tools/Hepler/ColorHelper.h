//
//  AppHelper.h
//  CNTaiPingEhome
//
//  Created by jiangchao on 16/1/26.
//  Copyright © 2016年 cntaiping. All rights reserved.
//

#import <Foundation/Foundation.h>
  

@interface ColorHelper : NSObject
+ (UIColor *)appBlackColor;

+ (UIColor *)appLightGrayColor;

+ (UIColor *)appDarkGrayColor;

+ (UIColor *)appOrangeColor;

+ (UIColor *)appRedColor;

+ (UIColor *)appGrayColor;

+ (UIColor *)appGrayColorLight;

+ (UIColor *)appBgColor;

+ (UIColor *)appDisableColor;

+ (UIStoryboard*)getStoryBoardWithId:(NSString *)ID;

+ (NSString *)appVersion;

+ (UIColor *)newDarkBGColor;

+ (UIColor *)newViewBGColor;
+ (UIColor *)newDarkSplitColor;

+ (UIColor *)newDarkTextColor;

+ (UIColor *)newOrangeColor;

+ (UIColor *)newSplitColor;

+ (UIColor *)newLightTextColor;
+ (UIColor *)appLineColor;
+ (UIView *)lineView;
+ (UILabel *)labelWithColor:(UIColor *)color Font:(UIFont *)font;

+ (CGFloat)heightWithWidth:(NSString *)content width:(CGFloat)width font:(UIFont *)font;

+ (CGRect)heightWithLableText:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize;


+ (NSString *)currentTimeStringWithDate:(NSDate *)date;

@end

@interface NSString (AppHelper)

- (BOOL)isBlankOrNil;

@end

@interface UIImage (AppHelper)

- (UIImage *)scaleToSize:(CGSize)size;

@end

