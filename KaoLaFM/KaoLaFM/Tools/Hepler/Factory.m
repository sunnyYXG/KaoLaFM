//
//  Factory.m
//  MyHelps
//
//  Created by rongyun on 16/5/26.
//  Copyright © 2016年 YXGang. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+ (UIButton *)createButtonWithTitle:(NSString *)title
                             target:(id)target
                           selector:(SEL)selector {
    
    return [self createButtonWithTitle:title titleFont:14.F textColor:[UIColor blackColor] backgroundColor:[UIColor colorWithRed:0.3f green:0.8f blue:1.f alpha:1.f] target:target selector:selector];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title  titleFont:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)bgColor target:(id)target selector:(SEL)selector{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 3.f;
    button.layer.masksToBounds = YES;
    button.titleLabel.font=[UIFont systemFontOfSize:size];
    button.backgroundColor = bgColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UILabel *)createLabelWithTitle:(NSString *)title  {
    return [self createLabelWithTitle:title fontSize:14.f];
}

+ (UILabel *)createLabelWithTitle:(NSString *)title  textColor:(UIColor *)color {
    return [self createLabelWithTitle:title textColor:color fontSize:14.f textAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)createLabelWithTitle:(NSString *)title  fontSize:(CGFloat)size {
    return [self createLabelWithTitle:title textColor:[UIColor blackColor] fontSize:size textAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)createLabelWithTitle:(NSString *)title  textColor:(UIColor *)color fontSize:(CGFloat)size textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+ (UIView *)createViewWithBackgroundColor:(UIColor *)color  {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}


+ (UITextField *)createFieldWithText:(NSString *)text  placeholder:(NSString *)placeholder textColor:(UIColor *)color borderStyle:(UITextBorderStyle)borderStyle {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.borderStyle = borderStyle;
    textField.text = text;
    textField.textColor = color;
    return textField;
}



@end







