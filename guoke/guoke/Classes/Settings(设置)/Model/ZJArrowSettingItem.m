//
//  ZJArrowSettingItem.m
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJArrowSettingItem.h"

@implementation ZJArrowSettingItem

+ (instancetype)arrowSettingItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass{
    ZJArrowSettingItem *item = [self settingItemWithIcon:icon selectedIcon:icon_h title:title subTitle:subTitle];
    item.vcClass = destVcClass;
    return item;
}

@end
