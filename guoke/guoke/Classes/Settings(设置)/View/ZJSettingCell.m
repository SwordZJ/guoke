//
//  ZJSettingCell.m
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJSettingCell.h"
#import "ZJSettingItem.h"
#import "ZJArrowSettingItem.h"
#import "ZJSwitchSettingItem.h"
#import "ZJLabelSettingItem.h"

@interface ZJSettingCell ()
/**
 * 辅助标签视图
 */
@property (nonatomic, strong) UIImageView *IconView;
/**
 * 辅助开关视图
 */
@property (nonatomic, strong) UISwitch *rightSwitch;
/**
 * 标签辅助视图
 */
@property (nonatomic, strong) UILabel *rightLabel;
@end


@implementation ZJSettingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

#pragma mark - 控件懒加载
-(UIImageView *)IconView{
    if (!_IconView ) {
        _IconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _IconView;
}


-(UISwitch *)rightSwitch{
    if (!_rightSwitch) {
        _rightSwitch = [[UISwitch alloc] init];
        _rightSwitch.on = [[NSUserDefaults standardUserDefaults] objectForKey:self.item.title];
        [_rightSwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _rightSwitch;
}

-(UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        if ([self.item isKindOfClass:[ZJLabelSettingItem class]]) {
            ZJLabelSettingItem *lableSettingItem = (ZJLabelSettingItem *)self.item;
            _rightLabel.text = lableSettingItem.accesoryTitle;
            [_rightLabel sizeToFit];
            _rightLabel.frame = CGRectMake(self.width - _rightLabel.width, self.centerY, _rightLabel.width, _rightLabel.height);
        }
    }
    return _rightLabel;
}


#pragma mark - 事件处理
- (void)switchChange:(UISwitch *)rightSwitch{
    [[NSUserDefaults standardUserDefaults] setBool:rightSwitch.isOn forKey:self.item.title];
}

#pragma mark - 重写模型的setter方法，设置数据
- (void)setItem:(ZJSettingItem *)item{
    _item = item;
    
    if (item.icon.length) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    if (item.icon_h.length) {
        self.imageView.highlightedImage = [UIImage imageNamed:item.icon_h];
    }
    
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    // 设置辅助视图
    if ([item isKindOfClass:[ZJArrowSettingItem class]]) {
        self.accessoryView = self.IconView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if([item isKindOfClass:[ZJSwitchSettingItem class]]){
        self.accessoryView = self.rightSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if([item isKindOfClass:[ZJLabelSettingItem class]]){
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = self.rightLabel;
    }else{
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
    }
    
    
}
@end
