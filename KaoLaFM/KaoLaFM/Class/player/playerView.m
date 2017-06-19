//
//  playerView.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "playerView.h"
#import "YXGAVPlayer.h"

@interface playerView()<YXGAVPlayerDelegate>{

}

@property(nonatomic,copy)NSArray *songArr;//歌曲数组
@property(nonatomic,copy)NSArray *songNameArr;//歌曲名称数组
@property(nonatomic,copy)NSArray *songAuthorArr;//歌曲演唱者数组
@property(nonatomic,copy)NSArray *songImageArr;//歌曲图片数组

@property(nonatomic)UIButton *playBt;//播放\暂停按钮

@end

@implementation playerView
#pragma mark---歌曲名称数组
-(NSArray *)songNameArr
{
    _songNameArr=@[@"火星情报局 (《火星情报局》节目主题曲)",@"下一站我是你的依靠",@"世界上不存在的歌(《火锅英雄》电影主题曲)"];
    return _songNameArr;
}
#pragma mark---歌曲流媒体地址
-(NSArray *)songArr
{
    _songArr=@[@"http://image.kaolafm.net/mz/audios/201706/d1779152-bde7-41a0-b9b1-f4cea6e7dc57.mp3"];
    return _songArr;
}
#pragma mark---歌曲演唱者数组
-(NSArray *)songAuthorArr
{
    _songAuthorArr=@[@"华晨宇"];
    return _songAuthorArr;
}
#pragma mark---歌曲图片的数组
-(NSArray *)songImageArr
{
    _songImageArr=@[@"http://i.gtimg.cn/music/photo/mid_album_300/W/8/003re5702kSBW8.jpg"];
    return _songImageArr;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        //添加playerView
        [self addPlayerView];
        //添加信息
        [self addSongInformation];
        //添加播放器的控件
        [self addPlayerControls];
    }
    return self;

}
#pragma mark---添加playerView
-(void)addPlayerView
{
    _player=[[YXGAVPlayer alloc]initWithFrame:CGRectMake(5, 5, self.height -10, self.height -10) andSongUrlArr:self.songArr andSongImageArr:self.songImageArr];
    _player.delegate=self;
    _player.layer.cornerRadius=(self.height-10)/2;
    _player.layer.masksToBounds=YES;
    _player.backgroundColor=[UIColor orangeColor];
    //设置volume，不设置默认为0.5
    _player.volume=0.8;
    [self addSubview:_player];
}
#pragma mark----SZKAVPlayerDelegate代理方法
-(void)getSongCurrentTime:(NSString *)currentTime andTotalTime:(NSString *)totalTime andProgress:(CGFloat)progress andTapCount:(NSInteger)tapCount
{
}
#pragma makr---添加歌曲的信息
-(void)addSongInformation
{

}
#pragma mark---添加播放器的播放，下一首，上一首按钮控件
-(void)addPlayerControls
{
    //播放\暂停按钮
    _playBt=[[UIButton alloc]initWithFrame:CGRectMake(_player.right + 40, 20, 25, 25)];
    [_playBt setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    _playBt.selected = YES;
    [_playBt addTarget:self action:@selector(playBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playBt];
}
#pragma mark---播放暂停按钮点击
-(void)playBtClick:(UIButton *)sender
{
    if (sender.selected==NO) {
        //暂停播放
        [_player puasePlay];
        [_playBt setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        sender.selected=YES;
    }else if(sender.selected==YES){
        //开始播放
        [_player startPlay];
        [_playBt setBackgroundImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        sender.selected=NO;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
