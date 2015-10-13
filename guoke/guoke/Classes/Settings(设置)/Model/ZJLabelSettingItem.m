//
//  ZJLabelSettingItem.m
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJLabelSettingItem.h"

@implementation ZJLabelSettingItem

+ (instancetype)labelSettingItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle accessoryTitle:(NSString *)accesoryTitle{
    ZJLabelSettingItem *item = [self settingItemWithIcon:icon selectedIcon:icon_h title:title subTitle:subTitle];
    item.accesoryTitle = accesoryTitle;
    return item;
}
@end
