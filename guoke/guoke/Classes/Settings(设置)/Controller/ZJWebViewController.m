//
//  ZJWebViewController.m
//  guoke
//
//  Created by liuzhouji on 15/10/13.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJWebViewController.h"

@interface ZJWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ZJWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
