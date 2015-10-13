//
//  ZJFeedBackViewController.m
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJFeedBackViewController.h"
//#import "MBProgressHUD+MJ.h"
#import <SVProgressHUD.h>

@interface ZJFeedBackViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextView *comments;

@end

@implementation ZJFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *item = [UIBarButtonItem itemWithTitle:@"提交" titleColor:[UIColor blackColor] selectedTitleColor:[UIColor grayColor] image:nil selectedBackgroudImage:nil target:self action:@selector(commitClick)];
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    [item setItemTextAttributes:attrs];
    self.navigationItem.rightBarButtonItem = item;
    
    
    
//    UIButton *test = [UIButton buttonWithType:UIButtonTypeCustom];
//    test.frame = CGRectMake(100, 100, 100, 100);
//    test.backgroundColor = ZJRandomColor;
//    [self.view addSubview:test];
//    [test addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];
    
}
//-(void)testClick{
//    [MBProgressHUD showMessage:@"正在提交..."];
//#warning 模拟发送网络请求
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 移除网络请求
//        [MBProgressHUD hideHUD];
//        // 返回请求结果
//        [MBProgressHUD showSuccess:@"提交成功！"];
//    });
//}

- (void)commitClick{
    NSString *title = nil;
    NSString *message = nil;
    if (self.email.text.length == 0) {
        title = @"请填写邮箱";
        message = @"咦？要填写邮箱哦~";
        [self addAlertVcWithTitle:title message:message];
        return;
    }else if (self.comments.text.length == 0){
        title = @"请填写内容";
        message = @"咦？要填写内容哦~";
        [self addAlertVcWithTitle:title message:message];
        return;
    }
    
//        [MBProgressHUD showMessage:@"正在提交..."];
//#warning 模拟发送网络请求
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 移除网络请求
//        [MBProgressHUD hideHUD];
//        // 返回请求结果
//        [MBProgressHUD showSuccess:@"提交成功！"];
//    });
    [SVProgressHUD showWithStatus:@"正在提交..." maskType:SVProgressHUDMaskTypeBlack];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [SVProgressHUD showSuccessWithStatus:@"提交成功" maskType:SVProgressHUDMaskTypeBlack];
    });
    

}

- (void)addAlertVcWithTitle:(NSString *)title message:(NSString *)message{
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好吧" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
