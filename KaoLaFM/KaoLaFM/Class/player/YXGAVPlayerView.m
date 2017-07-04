//
//  playerView.m
//  KaoLaFM
//
//  Created by rongyun on 2017/6/14.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "YXGAVPlayerView.h"
#import "YXGAVPlayer.h"
#import "YXGRollingLabel.h"
@interface YXGAVPlayerView()<YXGAVPlayerDelegate>{

}

@property(nonatomic)UIButton *playBt;//播放\暂停按钮
@property(nonatomic)UIButton *playList;//显示列表
@property(nonatomic)UILabel *Author;//作者
@property (nonatomic) YXGRollingLabel *name;

@end

@implementation YXGAVPlayerView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [ColorHelper playerBGViewColor];
        //添加playerView
        [self addPlayerView];
        //添加信息
        [self addSongInformation];
        //添加播放器的控件
        [self addPlayerControls];
        
        [AppNotification registe:NOTIFICATION_TYPE_PALYER receiver:self action:@selector(Player_Notification:)];
    }
    return self;

}
#pragma mark---添加playerView
-(void)addPlayerView
{
    _player=[[YXGAVPlayer alloc]initWithFrame:CGRectMake(5, 5, self.height -10, self.height -10)];
    _player.delegate=self;
    _player.layer.cornerRadius=(self.height-10)/2;
    _player.layer.masksToBounds=YES;
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
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"player.plist"];
    NSMutableDictionary *BaseDic = [NSMutableDictionary dictionaryWithContentsOfFile:filename];


    NSDictionary *mdic;
    if(BaseDic == nil){
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm createFileAtPath:self.filename contents:nil attributes:nil];
    }else{
        mdic= [BaseDic objectForKey:@"albumId"];
    }

//    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"sina",@"1",@"163",@"2",nil];
//    [dic writeToFile:filename atomically:YES];
//    
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
    NSLog(@"dic is:%@",dic2);

    _name = [[YXGRollingLabel alloc] initWithFrame:CGRectMake(_player.right + 10, 5, SCREEN_WIDTH/3 * 2 - _player.right - 20, (self.height - 15)/2) withString:[HelperTools isBlankString:mdic[@"dataReport"]]];

    _Author = [[UILabel alloc]initWithFrame:CGRectMake(_player.right + 10, _name.bottom + 5, _name.width, _name.height)];
    _Author.font = [UIFont systemFontOfSize:16.0f];;
    [self addSubview:_Author];
    [self addSubview:_name];

    _Author.textColor = [UIColor whiteColor];
    _Author.text = [HelperTools isBlankString:mdic[@"albumName"]];
    
//    _name.speed = 0.8;
    [_name setOrientation:RollingOrientationLeft];
    [_name setInternalWidth:_name.frame.size.width / 3];;


}
#pragma mark---添加播放器的播放按钮控件
-(void)addPlayerControls
{
    //播放\暂停按钮
    _playBt=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3 * 2, 15, 35, 35)];
    [_playBt setBackgroundImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
    _playBt.selected = NO;
    [_playBt addTarget:self action:@selector(playBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playBt];
    
    _playList=[[UIButton alloc]initWithFrame:CGRectMake(_playBt.right + (SCREEN_WIDTH/3 - 75)/2, 20, 25, 25)];
    [_playList setBackgroundImage:[UIImage imageNamed:@"playList_pic"] forState:UIControlStateNormal];
//    [_playList setImage:[UIImage imageNamed:@"playList_pic"] forState:UIControlStateNormal];
    [self addSubview:_playList];
    
}
#pragma mark---播放暂停按钮点击
-(void)playBtClick:(UIButton *)sender
{

    NSNumber *yet;
    if (sender.selected==YES) {
        //暂停播放
        [_player puasePlay];
        [_playBt setBackgroundImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
        sender.selected=NO;
        yet = [NSNumber numberWithBool:NO];
    }else if(sender.selected==NO){
        //开始播放
        [_player startPlay];
        [_playBt setBackgroundImage:[UIImage imageNamed:@"btn_player_pause_on"] forState:UIControlStateNormal];
        sender.selected=YES;
        yet = [NSNumber numberWithBool:YES];
    }
    [AppNotification send:@"changePlayer" userInfo:@{@"isPlayer":yet}];

}


- (void)Player_Notification:(NSNotification *)n{
    NSDictionary *dic = n.userInfo[PALYER_KEY];
    _Author.text = dic[@"albumName"];
    [self.player playNewWith:dic];
    [self.name stringWithTitle:dic[@"dataReport"]];
    [HelperTools playID:@"albumId" object:dic];
    
    NSInteger on = [n.userInfo[@"on"] integerValue];
    NSString *m = n.userInfo[@"m"];
    [self playBtClick:self.playBt];

    if (on == 0) {
        [self.name pauseTimer];
    }else{
        if ([m integerValue] == 1) {
        } else {
            [_player startIconViewAnimate];
        }

 
    }
    
}
-(void)dealloc{
    [AppNotification remove:NOTIFICATION_TYPE_PALYER receiver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
