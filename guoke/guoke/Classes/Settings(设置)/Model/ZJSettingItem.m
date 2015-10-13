//
//  ZJSettingItem.m
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJSettingItem.h"

@implementation ZJSettingItem


- (instancetype)initWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle{
    ZJSettingItem *item = [[[self class] alloc] init];
    item.icon = icon;
    item.icon_h = icon_h;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}


+ (instancetype)settingItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle{
    return [[self alloc] initWithIcon:icon selectedIcon:icon_h title:title subTitle:subTitle];
}

@end
