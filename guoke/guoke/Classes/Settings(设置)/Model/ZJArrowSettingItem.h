//
//  ZJArrowSettingItem.h
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJSettingItem.h"

@interface ZJArrowSettingItem : ZJSettingItem
/** 控制器类名*/
@property (nonatomic, assign) Class vcClass;
/**
 *  快速创建ZJLabelSettingItem方法
 */
+ (instancetype)arrowSettingItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_h title:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass;

@end
