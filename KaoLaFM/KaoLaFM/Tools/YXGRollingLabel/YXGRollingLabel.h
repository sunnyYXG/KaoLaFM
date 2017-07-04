//
//  YXGRollingLabel.h
//  KaoLaFM
//
//  Created by rongyun on 2017/6/19.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kNumberOfLabel 2

typedef  void(^LabelClickBlock)(NSInteger index);

typedef NS_ENUM(NSInteger, RollingOrientation){
    RollingOrientationNone = 0,
    RollingOrientationLeft,
    RollingOrientationRight
};

@interface YXGRollingLabel : UIView{
    NSTimer *_timer;
    
    UILabel *_labels[kNumberOfLabel];
    
    NSMutableArray *_textArray;
    
    BOOL _CanRolling;
    
    NSMutableArray *_textRectArray;
    
    NSInteger _currentIndex;
    UIColor *_textColor;
    
    UIFont *_font;
}



@property (nonatomic, assign) RollingOrientation orientation;

@property (nonatomic, assign) CGFloat speed;

@property (nonatomic, assign) CGFloat internalWidth;

@property (nonatomic, assign) CGFloat offsetX;

@property (nonatomic, copy) LabelClickBlock labelClickBlock;


-(void)beginTimer;

-(void)pauseTimer;

-(void)stopTimer;

-(BOOL)isCanRolling;

- (void)stringWithTitle:(NSString *)string;

-(instancetype)initWithFrame:(CGRect)frame withString:(NSString *)str;
@end
