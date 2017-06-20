//
//  YXGRollingLabel.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/19.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "YXGRollingLabel.h"

#define KSelfWith self.frame.size.width
#define KSelfHeight self.frame.size.height

#define kFont [UIFont systemFontOfSize:16.0f]

@implementation YXGRollingLabel



-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        NSString *str = @"01234567890123456789";
        _textArray = [NSMutableArray arrayWithObjects:str, nil];
        _font = kFont;
        _textColor = [UIColor whiteColor];
        [self commonInit];
    }
    return self;
}
-(void)commonInit{
    [self stopTimer];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    _CanRolling = YES;
    
    _currentIndex = 0;
    _textRectArray = [NSMutableArray arrayWithCapacity:_textArray.count];
    
    self.offsetX = 0;
    self.internalWidth = KSelfWith / 3;
    self.speed = 0.8f;
    self.orientation = RollingOrientationLeft;
    self.clipsToBounds = YES;
    
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, KSelfHeight);
    for (int i = 0; i < _textArray.count; i++) {
        CGRect textRect = [((NSString *)_textArray[i]) boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:(_font ? _font : kFont)} context:nil];
        [_textRectArray addObject:[NSValue valueWithCGRect:textRect]];
    } 
    
        for (int i = 0; i < kNumberOfLabel; i++) {
            _labels[i] = [[UILabel alloc] init];
            _labels[i].numberOfLines = 1;
            _labels[i].textAlignment = NSTextAlignmentCenter;
            _labels[i].tag = 100 + i;
            _labels[i].userInteractionEnabled = YES;
            _labels[i].textColor = _textColor ? _textColor : [UIColor whiteColor];
            _labels[i].font = kFont;
            [self addSubview:_labels[i]];
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
            [_labels[i] addGestureRecognizer:tapGesture];
        }
    [self startTimer];
}

- (void)stringWithTitle:(NSString *)string{
    [_textArray replaceObjectAtIndex:0 withObject:string];
    [self commonInit];
}

-(void)labelTap:(UITapGestureRecognizer *)gesture{
    NSInteger tag = ((UILabel *)[gesture view]).tag - 100;
    NSInteger index;
    if(tag == 0){
        index = _currentIndex;
    }else if (tag == 1){
        index = (_currentIndex + 1) % _textArray.count;
    }else{
        index = _currentIndex;
    }
        
    
    if(self.labelClickBlock){
        self.labelClickBlock(index);
    }
}

-(void)dealloc{
    [self stopTimer];
}

#pragma Relation Methods of _timer
-(void)beginTimer{
    if(_timer == nil){
        [self startTimer];
        return;
    }
    if(_timer && [_timer isValid] && _CanRolling){
        [_timer setFireDate:[NSDate date]];
    }
}

-(void)startTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

-(void)pauseTimer{
    if(_timer && [_timer isValid] && _CanRolling){
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

-(void)stopTimer{
    [_timer invalidate];
    _timer = nil;
}

-(void)timerAction:(NSTimer *)timer{

    NSArray *labelArray = [self GetLabelRectArrayAtIndex:_currentIndex];//get reseted labelArray
    CGRect firstRect = [((NSValue *)[labelArray firstObject]) CGRectValue];
    CGRect lastRect = [((NSValue *)[labelArray lastObject]) CGRectValue];
    
    NSInteger sign;
    sign = (self.orientation == RollingOrientationLeft) ? 1 : -1;
    self.offsetX =  self.offsetX - sign * self.speed;
    
    CGFloat nextOffX = self.offsetX + sign * (((self.orientation == RollingOrientationLeft)? firstRect.size.width : lastRect.size.width) + self.internalWidth);
    
    NSArray *labelTextArray = [self GetLabelTextArrayAtIndex:_currentIndex];
    
    
    if((self.offsetX > -firstRect.size.width && self.orientation == RollingOrientationLeft) ||
           (self.offsetX < KSelfWith && self.orientation == RollingOrientationRight) ){
        
        _labels[0].frame = CGRectMake(self.offsetX, (KSelfHeight-firstRect.size.height)/2, firstRect.size.width, firstRect.size.height);
        _labels[0].text = [labelTextArray firstObject];
            
        _labels[1].frame = CGRectMake(nextOffX, (KSelfHeight-lastRect.size.height) / 2, lastRect.size.width, lastRect.size.height);
        _labels[1].text = [labelTextArray lastObject];
    }
    else if((self.offsetX <= -firstRect.size.width  && self.orientation == RollingOrientationLeft) ||
                (self.offsetX >= KSelfWith && self.orientation == RollingOrientationRight)){
        self.offsetX = _labels[1].frame.origin.x;
            
        _currentIndex = (_currentIndex + 1)  % _textArray.count;
    }
}


-(NSArray *)GetLabelTextArrayAtIndex:(NSInteger)index{
    NSMutableArray *labelTextArray = [NSMutableArray arrayWithCapacity:kNumberOfLabel];
    [labelTextArray removeAllObjects];
    [labelTextArray addObject:[_textArray objectAtIndex:index]];
    [labelTextArray addObject:[_textArray objectAtIndex:(index + 1) % _textArray.count]];
    return labelTextArray;
}

-(NSArray *)GetLabelRectArrayAtIndex:(NSInteger)index{
    NSMutableArray *labelRectArray = [NSMutableArray arrayWithCapacity:kNumberOfLabel];
    [labelRectArray removeAllObjects];
    NSValue *firstValue = [_textRectArray objectAtIndex:index];
    NSValue *lastValue = [_textRectArray objectAtIndex:(index + 1) % _textArray.count];
    [labelRectArray addObject:firstValue];
    [labelRectArray addObject:lastValue];
    return labelRectArray;
}



#pragma setter and getter
-(void)setSpeed:(CGFloat)speed{
    if(speed > 0){
        _speed = speed;
    }
}

-(void)setInternalWidth:(CGFloat)internalWidth{
    if(internalWidth > 0){
        _internalWidth = internalWidth;
    }
}

-(BOOL)isCanRolling{
    return _CanRolling;
}



@end
