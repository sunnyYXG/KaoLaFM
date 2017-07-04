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

+ (void)savePlayerWithObject:(NSDictionary *)dic{
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"MyPlayer"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)playID:(NSString *)playID object:(NSDictionary *)object{
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"player.plist"];
    NSDictionary *BaseDic = [NSDictionary dictionaryWithContentsOfFile:filename];
    
    if(BaseDic == nil){
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm createFileAtPath:filename contents:nil attributes:nil];
    }
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:object,@"albumId",nil];
    [dic writeToFile:filename atomically:YES];
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
    NSLog(@"BaseDic is:%@",dic2);
}

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

+ (NSValue *)withFrame:(CGRect)frame{
    return [NSValue valueWithCGRect:frame];
}

+(CGRect)withNSValue:(NSValue *)value{
    return [value CGRectValue];
}

+ (NSString *) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return @"";
    }
    return string;
}


/**
 返回创建的rect

 @param left 距离父视图 左边距离
 @param top 距离父视图 顶部距离
 @param n 每行n个
 @param w 控件宽度
 @param h 控件高度
 @param vBottom 控件 垂直间距
 @param hBottom 控件 水平间距
 @param arr 需要创建rect的控件数组
 @return 返回返回CGRect
 */
+ (NSArray *)rectWithCreateUIWithLeft:(CGFloat)left top:(CGFloat)top num:(NSInteger)n width:(CGFloat)w height:(CGFloat)h Vertical:(CGFloat)vBottom Horizontal:(CGFloat)hBottom  arr:(NSArray *)arr{
    CGFloat _y = 0;
    CGFloat _X = 0;
    NSMutableArray *rects = [NSMutableArray new];
    for (NSInteger i = 0; i < arr.count; i ++) {
        _X = i%n;
        _y = i/n;
        
        CGRect rect = CGRectMake(left + (w+vBottom) * _X, top + _y * (h+hBottom), w, h);
        NSValue *value = [self withFrame:rect];
        [rects addObject:value];
    }
    return rects;
}


//设置小三角旋转的事件
//-(void)btnClicked:(UIButton *)titleBtn
//{
//    if (!self.isOpen) {
//        [UIView animateWithDuration:1 animations:^{
//            titleBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
//        }];
//        self.open = YES;
//    }
//    else
//    {
//        [UIView animateWithDuration:1 animations:^{
//            titleBtn.imageView.transform = CGAffineTransformIdentity;
//        }];
//        self.open = NO;
//    }
//}
//获取字符串的宽度
+ (float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}
//获得字符串的高度
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}

@end
