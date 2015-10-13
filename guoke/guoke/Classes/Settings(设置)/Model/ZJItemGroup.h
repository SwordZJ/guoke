//
//  ZJItemGroup.h
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJItemGroup : NSObject

/** 头部标题*/
@property (nonatomic, copy) NSString *headerTitle;

/** 组标签*/
@property (nonatomic, strong) NSArray *items;

/** 底部视图*/
@property (nonatomic, copy) NSString *footerTitle;

@end
