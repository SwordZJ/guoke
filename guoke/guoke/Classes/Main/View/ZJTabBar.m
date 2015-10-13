//
//  ZJTabBar.m
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJTabBar.h"
#import "ZJTabCell.h"

@implementation ZJTabBar
static NSString *const ZJTabCellID = @"tabCell";
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        // 创建标签视图
        self.backgroundColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:0.9];;
        self.rowHeight = 60;
        self.contentSize = CGSizeZero;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.bounces = NO;
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ZJTabCell class]) bundle:nil] forCellReuseIdentifier:ZJTabCellID];
    }
    return self;
}
@end
