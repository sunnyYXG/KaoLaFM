//
//  Factory.h
//  MyHelps
//
//  Created by rongyun on 16/5/26.
//  Copyright © 2016年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Factory : NSObject

//创建Button的工厂，将特殊的元素传入，生产相对应的Button
+ (UIButton *)createButtonWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;

+ (UIButton *)createButtonWithTitle:(NSString *)title titleFont:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)bgColor target:(id)target selector:(SEL)selector;

//创建Label的工厂，将特殊的元素传入，生产相对应的Label
+ (UILabel *)createLabelWithTitle:(NSString *)title;
+ (UILabel *)createLabelWithTitle:(NSString *)title textColor:(UIColor *)color;
+ (UILabel *)createLabelWithTitle:(NSString *)title fontSize:(CGFloat)size;
+ (UILabel *)createLabelWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat)size textAlignment:(NSTextAlignment)textAlignment;

//创建View的工厂，将特殊的元素传入，生产相应的View
+ (UIView *)createViewWithBackgroundColor:(UIColor *)color ;

//创建textField的工厂，将特殊的元素传入，生产响应的textField
+ (UITextField *)createFieldWithText:(NSString *)text placeholder:(NSString *)placeholder textColor:(UIColor *)color borderStyle:(UITextBorderStyle)borderStyle;
@end
