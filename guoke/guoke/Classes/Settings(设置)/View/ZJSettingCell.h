//
//  ZJSettingCell.h
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJSettingItem;
@interface ZJSettingCell : UITableViewCell

/** 一个cell对应一个Item模型*/
@property (nonatomic, strong) ZJSettingItem *item;
@end
