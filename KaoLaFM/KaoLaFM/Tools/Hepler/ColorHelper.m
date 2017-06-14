//
//  ColorHelper.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ColorHelper.h"


@implementation ColorHelper


+ (CGFloat)heightWithWidth:(NSString *)content width:(CGFloat)width font:(UIFont *)font
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName : font}];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size.height;
}

//动态计算lable文字高度
+ (CGRect)heightWithLableText:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize {
   CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    return rect;
}

+ (NSString *)currentTimeStringWithDate:(NSDate *)date {
   
    NSDateFormatter *fm1 = [[NSDateFormatter alloc] init];
    [fm1 setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [fm1 stringFromDate:date];
    
    return dateStr;
}


+(UIStoryboard*)getStoryBoardWithId:(NSString *)ID
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:ID bundle:[NSBundle mainBundle]];
    return sb;
}

+ (UIColor *)appBlackColor {
    return YUKEYRGB(89, 88, 89, 1);
}

+ (UIColor *)appLightGrayColor {
    return YUKEYRGB(240, 240, 240, 1);
}

+ (UIColor *)appDarkGrayColor {
    return YUKEYRGB(70, 70, 71, 1);
}

+ (UIColor *)appOrangeColor {
    return YUKEYRGB(253, 175, 0, 1);
}

+ (UIColor *)appRedColor {
    return YUKEYRGB(214, 9, 33, 1);
}

+ (UIColor *)appGrayColor {
    return YUKEYRGB(156, 156, 156, 1);
}

+(UIColor *)appGrayColorLight{
    return YUKEYRGB(220, 220, 220, 1);
}

+ (UIColor *)appDisableColor {
    return YUKEYRGB(217, 217, 217, 1);
}

+ (UIColor *)appBgColor {
    return YUKEYRGB(237, 237, 237, 1);
}

+ (UIColor *)newDarkBGColor {
    return YUKEYRGB(72, 72, 72, 1);
}

+ (UIColor *)newViewBGColor {
    return YUKEYRGB(57, 57, 57, 1);
}

+ (UIColor *)newOrangeColor {
    return YUKEYRGB(252, 161, 9, 1);
}

+ (UIColor *)newSplitColor {
    return YUKEYRGB(232, 232, 232, 1);
}

+ (UIColor *)newDarkSplitColor {
    return YUKEYRGB(191, 191, 191, 1);
}

+ (UIColor *)newLightTextColor {
    return YUKEYRGB(147, 147, 147, 1);
}

+ (UIColor *)newDarkTextColor {
    return YUKEYRGB(136, 136, 136, 1);
}
+ (UIColor *)appLineColor{
    return [UIColor colorWithRed:0xF6/255.0 green:0xF6/255.0 blue:0xF6/255.0 alpha:1];
}
+ (UIView *)lineView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:0xF6/255.0 green:0xF6/255.0 blue:0xF6/255.0 alpha:1];
    return view;
}

+ (UILabel *)labelWithColor:(UIColor *)color Font:(UIFont *)font{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.font = font;
    return label;
}

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

@end


@implementation NSString (ColorHelper)
- (BOOL)isBlankOrNil
{
    return !self || self == nil || self.length == 0;
}
@end

@implementation UIImage (ColorHelper)
- (UIImage *)scaleToSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
@end





