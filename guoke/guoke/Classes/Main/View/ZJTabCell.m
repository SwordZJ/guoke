//
//  ZJTabCell.m
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJTabCell.h"
#import "ZJTabModel.h"

@interface ZJTabCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIImageView *indicator;

@end

@implementation ZJTabCell

-(void)awakeFromNib{
    self.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"]];
    
}


-(void)setTabModel:(ZJTabModel *)tabModel{
    _tabModel = tabModel;
    
    self.iconView.image = [UIImage imageNamed:tabModel.image_h];
    self.title.text = tabModel.text;
    self.title.textColor = [UIColor whiteColor];
    self.indicator.image = [UIImage imageNamed:@"selArrow"];
}
@end
