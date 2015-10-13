//
//  ZJTabModel.h
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJTabModel : NSObject
/** 选中图标*/
@property (nonatomic, copy) NSString *image_h;
/** 默认图标*/
@property (nonatomic, copy) NSString *image;
/** 跳转控制器*/
@property (nonatomic, copy) NSString *className;
/** 标题*/
@property (nonatomic, copy) NSString *text;

@end
