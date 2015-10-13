//
//  ZJSettingItem.h
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJSettingItem : NSObject
/** 图标*/
@property (nonatomic, copy) NSString *icon;
/** 高亮图标*/
@property (nonatomic, copy) NSString *icon_h;
/** 标题*/
@property (nonatomic, copy) NSString *title;
/** 子标题*/
@property (nonatomic, copy) NSString *subTitle;


/**
 *  快速创建方法
 */
- (instancetype)initWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle;
+ (instancetype)settingItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle;
@end
