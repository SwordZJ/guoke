//
//  ZJSettingsViewController.m
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJSettingsViewController.h"
#import "ZJItemGroup.h"
#import "ZJSettingItem.h"
#import "ZJLabelSettingItem.h"
#import "ZJArrowSettingItem.h"
#import "ZJSwitchSettingItem.h"
#import "ZJSettingCell.h"
#import "ZJLoginViewController.h"
#import "ZJAboutViewController.h"

@interface ZJSettingsViewController ()
/** 组数据*/
@property (nonatomic, strong) NSMutableArray *itemGroups;
@end

@implementation ZJSettingsViewController


- (NSMutableArray *)itemGroups{
    if (!_itemGroups) {
        _itemGroups = [NSMutableArray array];
    }
    return _itemGroups;
}


static NSString *ID = @"settingCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置初始化数据
    [self setupGroups];
    
    // 设置表格属性
    [self.tableView registerClass:[ZJSettingCell class] forCellReuseIdentifier:ID];

}


- (void)setupGroups{
    // 创建组
    ZJArrowSettingItem *loginItem = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem1 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem2 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem3 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem4 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem5 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem6 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem7 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem8 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem9 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem10 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem11 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJArrowSettingItem *loginItem12 = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"点击登录" subTitle:nil destVcClass:[ZJLoginViewController class]];
    ZJItemGroup *group0 = [[ZJItemGroup alloc] init];
    group0.items = @[loginItem, loginItem1, loginItem2, loginItem3, loginItem4, loginItem5, loginItem6, loginItem7, loginItem8, loginItem9, loginItem10, loginItem11, loginItem12];
    
    ZJSwitchSettingItem *offlineDownloadItem = [ZJSwitchSettingItem settingItemWithIcon:nil selectedIcon:nil title:@"自动离线下载" subTitle:nil];
    ZJItemGroup *group1 = [[ZJItemGroup alloc] init];
    group1.items = @[offlineDownloadItem];
    group1.footerTitle = @"打开后，WIFI下将自动下载最新的20篇文章供离线查看";
    
    ZJSwitchSettingItem *largeFontItem = [ZJSwitchSettingItem settingItemWithIcon:nil selectedIcon:nil title:@"大字体" subTitle:nil];
    ZJLabelSettingItem *clearCachesItem = [ZJLabelSettingItem labelSettingItemWithIcon:nil selectedIcon:nil title:@"清理缓存" subTitle:nil accessoryTitle:@"0M"];
    ZJItemGroup *group2 = [[ZJItemGroup alloc] init];
    group2.items = @[largeFontItem,clearCachesItem];

    ZJArrowSettingItem *aboutUsItem = [ZJArrowSettingItem arrowSettingItemWithIcon:nil selectedIcon:nil title:@"关于我们" subTitle:nil destVcClass:[ZJAboutViewController class]];
    ZJItemGroup *group3 = [[ZJItemGroup alloc] init];
    group3.items = @[aboutUsItem];
    
    [self.itemGroups addObjectsFromArray:@[group0, group1, group2, group3]];
    
}



#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.itemGroups.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZJItemGroup *itemGroup = self.itemGroups[section];
    return itemGroup.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    1.创建cell
    ZJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //    2.设置cell的数据
    ZJItemGroup *group = self.itemGroups[indexPath.section];
    ZJSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    //    3.返回cell
    return cell;
}

#pragma mark - UITableViewDelegate
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [self.itemGroups[section] footerTitle];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZJItemGroup *group = self.itemGroups[indexPath.section];
    ZJSettingItem *item = group.items[indexPath.row];
    if ([item isKindOfClass:[ZJArrowSettingItem class]]) {
        ZJArrowSettingItem *arrowItem = (ZJArrowSettingItem *)item;
        UIViewController *pushVc = [[arrowItem.vcClass alloc] init];
        pushVc.title = item.title;
        [self.navigationController pushViewController:pushVc animated:YES];
    }
}

@end
