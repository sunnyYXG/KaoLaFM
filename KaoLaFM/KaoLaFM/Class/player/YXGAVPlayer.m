//
//  YXGAVPlayer.m
//  YXGAVPlayer
//
//  Created by sunny_FX on 2017/6/17.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGAVPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import <UIImageView+AFNetworking.h>

@interface YXGAVPlayer()

@property(nonatomic,retain)AVPlayerItem *songItem;
@property(nonatomic,retain)AVPlayer *player;
@property(nonatomic,retain)id timeObserver;//时间观察
@property(nonatomic) BOOL is_first;
@end

@implementation YXGAVPlayer

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        //初始化songItem和player
        _player=[AVPlayer playerWithPlayerItem:_songItem];
        //声音设置为0.5;
        _volume=0.5;
        //添加播放器状态的监听
        [self addAVPlayerStatusObserver];
        //添加数据缓存的监听
        [self addNetDataStatusObserver];
        //player的背景图片
        _playerImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _playerImage.image = [UIImage imageNamed:@"head_image"];
        //添加背景图片
        [self addSubview:_playerImage];
        self.is_first = YES;
    }
    return self;
}
#pragma mark - 创建基本动画
- (void)startIconViewAnimate
{
    //1.创建基本动画
    CABasicAnimation *rotateAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //2.设置属性
    rotateAnim.fromValue = @(0);
    rotateAnim.toValue = @(M_PI * 2);
    rotateAnim.repeatCount = NSIntegerMax;
    rotateAnim.duration = 40;
    
    //3.添加动画到图上
    [self.playerImage.layer addAnimation:rotateAnim forKey:nil];
}

#pragma mark - 暂停动画
- (void)pauseAnimation {
    
    //（0-5）
    //开始时间：0
    //    myView.layer.beginTime
    //1.取出当前时间，转成动画暂停的时间
    CFTimeInterval pauseTime = [self.playerImage.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    //2.设置动画的时间偏移量，指定时间偏移量的目的是让动画定格在该时间点的位置
    self.playerImage.layer.timeOffset = pauseTime;
    
    //3.将动画的运行速度设置为0， 默认的运行速度是1.0
    self.playerImage.layer.speed = 0;
    
}

#pragma mark - 恢复动画
- (void)resumeAnimation {
    
    //1.将动画的时间偏移量作为暂停的时间点
    CFTimeInterval pauseTime = self.playerImage.layer.timeOffset;
    
    //2.计算出开始时间
    CFTimeInterval begin = CACurrentMediaTime() - pauseTime;
    
    [self.playerImage.layer setTimeOffset:0];
    [self.playerImage.layer setBeginTime:begin];
    
    self.playerImage.layer.speed = 1;
    

}



#pragma mark---开始播放
-(void)startPlay
{
    [_player play];
//    [self resumeAnimation];
    if (self.is_first) {
        [self startIconViewAnimate];
        self.is_first = NO;
    }else{
        [self resumeAnimation];
    }
    
}
#pragma mark---暂停播放
-(void)puasePlay
{
    [_player pause];
    [self pauseAnimation];
}
#pragma mark----播放下一首
-(void)nextSong
{
    //移除所有监听
    [self removeAllNotice];
    //添加播放器状态的监听
    [self addAVPlayerStatusObserver];
    //添加数据缓存的监听
    [self addNetDataStatusObserver];
    
    [self startIconViewAnimate];
    [self resumeAnimation];
}
#pragma mark---播放上一首
-(void)lastSong
{

    //移除所有监听
    [self removeAllNotice];
    //添加播放器状态的监听
    [self addAVPlayerStatusObserver];
    //添加数据缓存的监听
    [self addNetDataStatusObserver];
    
    [self startIconViewAnimate];
    [self resumeAnimation];

}
-(void)playNewWith:(NSDictionary *)dic{
    //移除所有监听
    [self removeAllNotice];
    [_playerImage sd_setImageWithURL:[NSURL URLWithString:dic[@"pic"]]];
    //替换songItem
    NSURL *NETurl=[NSURL URLWithString:dic[@"mp3PlayUrl"]];
    _songItem=[AVPlayerItem playerItemWithURL:NETurl];
    [_player replaceCurrentItemWithPlayerItem:_songItem];
    [_player play];
    //添加播放器状态的监听
    [self addAVPlayerStatusObserver];
    //添加数据缓存的监听
    [self addNetDataStatusObserver];
    
    [self startIconViewAnimate];
    [self resumeAnimation];

}
#pragma mark----设置player的volume
-(void)setPlayerVolume
{
    _player.volume=_volume;
}
#pragma mark---移除时间观察者
-(void)removeTimeObserver
{
    if (_timeObserver) {
        [_player removeTimeObserver:_timeObserver];
        _timeObserver=nil;
    }
}
#pragma mark---float转00:00类型
- (NSString *)formatTime:(float)num{
    
    int sec =(int)num%60;
    int min =(int)num/60;
    if (num < 60) {
        return [NSString stringWithFormat:@"00:%02d",(int)num];
    }
    return [NSString stringWithFormat:@"%02d:%02d",min,sec];
}
#pragma mark----监听播放器的加载状态
-(void)addAVPlayerStatusObserver
{
    [_songItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}
#pragma mark----数据缓冲状态的监听
-(void)addNetDataStatusObserver
{
    [_songItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
#pragma mark----KVO方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //播放器缓冲状态
    if ([keyPath isEqualToString:@"status"]) {
        switch (_player.status) {
            case AVPlayerStatusUnknown:{
                NSLog(@"未知状态，此时不能播放");
            }
                break;
            case AVPlayerStatusReadyToPlay:{
                NSLog(@"准备完毕，可以播放");
                //添加播放完成的通知
                [self addPlayToEndObserver];
            }
                break;
            case AVPlayerStatusFailed:{
                NSLog(@"加载失败，网络或者服务器出现问题");
            }
                break;
            default:
                break;
        }
    }
    //数据缓冲状态
    if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        //缓冲时间的数组
        NSArray *array=_songItem.loadedTimeRanges;
        //本次缓冲的时间范围
        CMTimeRange timeRange=[array.firstObject CMTimeRangeValue];
        NSTimeInterval totalBuffer=CMTimeGetSeconds(timeRange.start)+CMTimeGetSeconds(timeRange.duration);//缓冲总长度
//        NSLog(@"共缓冲%.2f",totalBuffer);
    }
}
#pragma mark---移除媒体加载状态的监听
-(void)removeAVPlayerObserver
{
    [_songItem removeObserver:self forKeyPath:@"status"];
}
#pragma mark---移除数据加载状态的监听
-(void)removeNetDataObserver
{
    [_songItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
#pragma mark----播放完成后发送通知
-(void)addPlayToEndObserver
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:_songItem];
}
#pragma mark---通知的方法
-(void)playFinished:(NSNotification *)notice
{
    NSLog(@"播放完成，自动进入下一首");
    //播放下一首
    [self nextSong];
}
#pragma mark----移除通知
-(void)removePlayToEndNotice
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark-----移除所有监听
-(void)removeAllNotice
{
    //移除时间进度的监听
    [self removeTimeObserver];
    //移除播放完成的通知
    [self removePlayToEndNotice];
    //移除播放器状态的监听
    [self removeAVPlayerObserver];
    //移除数据缓存的监听
    [self removeNetDataObserver];
}
@end
