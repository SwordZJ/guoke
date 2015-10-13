//
//  ZJLoginViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJLoginViewController.h"
#import "ZJRegisterViewController.h"
@interface ZJLoginViewController ()

@end

@implementation ZJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
}


- (void)setupNav{
    
    self.title = @"无密码快捷登录";
    
    // 右边注册按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerBtnClick)];
}


#pragma mark - 按钮点击事件
- (void)registerBtnClick{
    // 弹出注册界面
    [self.navigationController pushViewController:[[ZJRegisterViewController alloc] init] animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
