//
//  ZJTabCell.h
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJTabModel;
@interface ZJTabCell : UITableViewCell

/** 标签模型*/
@property (nonatomic, strong) ZJTabModel *tabModel;

@end
