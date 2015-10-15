//
//  ZJLoginViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJLoginViewController.h"
#import "ZJRegisterViewController.h"
#import "UMSocial.h"
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


#pragma mark 第三方登录
- (IBAction)wechatLogin:(UIButton *)sender {
    
}

- (IBAction)tencentLogin:(UIButton *)sender {
//    
//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
//    
//    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//        
//        //          获取微博用户名、uid、token等
//        
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
//            
//            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//            
//        }});
}

/**
 *  新浪微博登录
 */
- (IBAction)sinaLogin:(UIButton *)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
}

- (IBAction)alipayLogin:(UIButton *)sender {
}

@end
