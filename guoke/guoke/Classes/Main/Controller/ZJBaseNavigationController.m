//
//  ZJBaseNavigationController.m
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJBaseNavigationController.h"

@interface ZJBaseNavigationController ()

@end

@implementation ZJBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize{
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    [attrs setObject:[UIFont systemFontOfSize:18] forKey:NSFontAttributeName];
    [navBar setTitleTextAttributes:attrs];
    
    
    // 3.设置导航条按钮的标题属性
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    dict1[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict1[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [barItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) { // 判断不是导航控制器根控制器
        // 设置返回item样式
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"navBack"] forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
