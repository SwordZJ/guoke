//
//  ZJRegisterViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/10.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJRegisterViewController.h"
#import "ZJWebViewController.h"
@interface ZJRegisterViewController ()

@end

@implementation ZJRegisterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
}

- (IBAction)checkBtn:(UIButton *)sender {
    sender.selected  = !sender.isSelected;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



- (IBAction)userProcotol:(id)sender {
    ZJWebViewController *webVc = [[ZJWebViewController alloc] init];
    webVc.title = @"用户须知";
    [self.navigationController pushViewController:webVc animated:YES];
}


@end


