//
//  ZJLabelSettingItem.h
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJSettingItem.h"

@interface ZJLabelSettingItem : ZJSettingItem

/** 辅助视图标题*/
@property (nonatomic, copy) NSString *accesoryTitle;

/**
 *  快速创建ZJLabelSettingItem方法
 */
+ (instancetype)labelSettingItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle accessoryTitle:(NSString *)accesoryTitle;

@end
