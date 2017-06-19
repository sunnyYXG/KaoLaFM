//
//  YXGAVPlayer.h
//  YXGAVPlayer
//
//  Created by sunny_FX on 2017/6/17.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YXGAVPlayerDelegate <NSObject>

@end

@interface YXGAVPlayer :  UIView
@property(nonatomic,retain)UIImageView *playerImage;//player的背景图片


/**
 *  songDelegate
 */
@property(nonatomic,retain)id<YXGAVPlayerDelegate>delegate;
/**
 *  volume 0.0~1.0
 */
@property(nonatomic,assign)CGFloat volume;

/**
 *  开始播放
 */
-(void)startPlay;
/**
 *  暂停播放
 */
-(void)puasePlay;
/**
 *  播放下一首
 */
-(void)nextSong;
/**
 *  播放上一首
 */
-(void)lastSong;

-(void)playNewWith:(NSDictionary *)dic;
@property (nonatomic)NSString *urlString;
@end
