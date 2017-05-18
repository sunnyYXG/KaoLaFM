//
//  HelperTools.m
//  CNTaiPingEhome
//
//  Created by rongyun on 16/11/2.
//  Copyright © 2016年 cntaiping. All rights reserved.
//

#import "HelperTools.h"

#define kMaxTextFieldLength 20
#define kMaxTextViewLength 300

@implementation HelperTools

//设置不同字体颜色
+ (void)setTextColor:(UILabel *)label AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    label.attributedText = str;
}

//设置不同字体颜色
+ (void)setTextColor:(UILabel *)label AndRange:(NSRange)range AndColor:(UIColor *)vaColor AndFont:(CGFloat)font
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //设置字号
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    //删除线
    [str addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];

    
    label.attributedText = str;
}


#pragma mark -- Label 多行显示 自适应高度
+ (CGRect)height:(UILabel *)label frame:(CGRect)frame{
    label.lineBreakMode=NSLineBreakByWordWrapping;
    label.numberOfLines=0;
    CGRect txtFrame = label.frame;
    label.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,
                             txtFrame.size.height =[label.text boundingRectWithSize:
                                                    CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil] context:nil].size.height);
    return CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, txtFrame.size.height);
}

+ (NSString *)HTtimeStamp{
    double timeStamp = ceil([[NSDate date] timeIntervalSince1970]);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setGeneratesDecimalNumbers:false];
    NSNumber *timeNumber = [NSNumber numberWithDouble:timeStamp];
    NSString *timeString = [formatter stringFromNumber:timeNumber];
    
    return timeString;
    //    return [NSNumber numberWithLongLong:[timeString longLongValue]];
}

+ (NSString *)stringWith_int:(NSInteger)integer{
    return [NSString stringWithFormat:@"%ld",integer];
}

@end
