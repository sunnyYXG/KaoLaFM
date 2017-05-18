//
//  BaseDefine.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#ifndef BaseDefine_h
#define BaseDefine_h

#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)
#define theApp                          ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define theWindow                       [[UIApplication sharedApplication] delegate].window

#define UIColorFromString(colorString)           [UIColor colorWithHexString:colorString]
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define kUserDefaultsCookie @"cookies"

///判断是否是ios7
#define isIOS7 (DeviceSystemMajorVersion()< 7 ? NO:YES)
///判断是否是ios8
#define isIOS8 (DeviceSystemMajorVersion()< 8 ? NO:YES)

#define isIOS9 (DeviceSystemMajorVersion()< 9 ? NO:YES)

#define isIOS10 (DeviceSystemMajorVersion()< 10 ? NO:YES)


#define IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IS_IPHONE6PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)


/**
 *  弱指针
 */
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#if __has_feature(objc_arc)
#define WEAK_BLOCK_SELF(type) __weak type *block_self=self;
#else
#define WEAK_BLOCK_SELF(type) __block type *block_self=self;
#endif


#ifdef DEBUG
#define DLog(...) NSLog(@"%s(第%d行) %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog(...)
#endif

#ifdef DEBUG
#define DDLog(...) NSLog(__VA_ARGS__)
#else
#define DDLog(...)
#endif


#endif /* BaseDefine_h */
