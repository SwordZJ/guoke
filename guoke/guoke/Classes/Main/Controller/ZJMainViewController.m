//
//  ZJMainViewController.m
//  guoke
//
//  Created by liuzhouji on 15/10/10.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJMainViewController.h"
#import "ZJBaseNavigationController.h"
#import "ZJHomeViewController.h"
#import "ZJCollectionViewController.h"
#import "ZJFeedBackViewController.h"
#import "ZJTabModel.h"
#import "ZJTabCell.h"
#import <MJExtension.h>
#import "ZJTabBar.h"

@interface ZJMainViewController ()<UITableViewDataSource,UITableViewDelegate>

/** 标题*/
@property (nonatomic, strong) NSArray *tabModels;

/** TabBar*/
@property (nonatomic, weak) UITableView *tabBar;


/** 当前选中cell的索引*/
@property (nonatomic, weak) NSIndexPath *selectedIndexPath;

/** 当前显示的导航控制器*/
@property (nonatomic, weak) UINavigationController *showNav;


/** 蒙板*/
@property (nonatomic, weak) UIButton *cover;
@end

@implementation ZJMainViewController

#pragma mark - 懒加载
- (NSArray *)tabModels{
    if (!_tabModels) {
        _tabModels = [ZJTabModel objectArrayWithFilename:@"Property.plist"];
    }
    return _tabModels;
}


#pragma mark - 初始化代码
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 设置table
    [self setupTabBar];
    
    // 设置子控制器
    [self setupChildVcs];
    
    // 默认选中第0个cell
    [self setStartSelectedCell];
}

- (void)setStartSelectedCell{
    NSIndexPath *startIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tabBar selectRowAtIndexPath:startIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.tabBar didSelectRowAtIndexPath:startIndexPath];
}

- (void)setupChildVcs{
    for (ZJTabModel *tabModel in self.tabModels) {
        Class vcClass = NSClassFromString(tabModel.className);
        if (!vcClass) continue;
        [self addChildVcsWith:[[vcClass alloc] init] title:tabModel.text];
    }
}
- (void)setupTabBar{
     // 创建标签视图
    ZJTabBar *tabBar = [[ZJTabBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.7, self.view.height) style:UITableViewStyleGrouped];
    [self.view addSubview:tabBar];
    tabBar.delegate = self;
    tabBar.dataSource = self;
    self.tabBar = tabBar;
}

- (void)addChildVcsWith:(UIViewController *)vc title:(NSString *)title{
    if ([title isEqualToString:@"首页"]) {
        title = @"果壳精选";
    }
    vc.title = title;
    
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_sider"] style:UIBarButtonItemStyleDone target:self action:@selector(menuClick)];
    
    ZJBaseNavigationController *baseNav = [[ZJBaseNavigationController alloc] initWithRootViewController:vc];
    baseNav.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    [self addChildViewController:baseNav];
    
    
}

#pragma mark - 事件处理
- (void)menuClick{
    // 移动当前显示控制器
    CGFloat offsetX = self.tabBar.width;

    [UIView animateWithDuration:0.25 animations:^{
        self.showNav.view.transform = CGAffineTransformMakeTranslation(offsetX, 0);
    } completion:^(BOOL finished) {
        // 添加遮盖
        UIButton *cover = [UIButton buttonWithType:UIButtonTypeCustom];
        cover.frame = self.showNav.view.bounds;
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        self.cover = cover;
        [self.showNav.view addSubview:cover];
    }];
    
}

// 点击遮盖
- (void)coverClick:(UIButton *)cover{
    // 移除控制器的形变
    [UIView animateWithDuration:0.25 animations:^{
        self.showNav.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tabModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJTabCell *cell = [ZJTabCell viewFromXib];
    cell.tabModel = self.tabModels[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.tabModels.count - 1) {
        // 跳转到AppStore，评分
        return;
    }
    // 判断当前索引和上一个选中的cell的索引对比
    if ((self.selectedIndexPath == indexPath)) return;
    UINavigationController *oldNav = self.childViewControllers[self.selectedIndexPath.row];
    [oldNav.view removeFromSuperview];
    
    UINavigationController *newNav = self.childViewControllers[indexPath.row];
    [self.view addSubview:newNav.view];
    newNav.view.transform = oldNav.view.transform;
    self.showNav = newNav;
    
    [self coverClick:self.cover];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.tabModels.count - 1) return;
    self.selectedIndexPath = indexPath;
}




@end
