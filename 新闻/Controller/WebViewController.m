//
//  WebViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "WebViewController.h"
#import "DataJSON.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"普通新闻";
    
    [self createWeb];
    
}

#pragma mark - 创建web
-(void)createWeb {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    //读取html路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    //读取数据
    NSString *pathData = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    //读取新闻json数据
    NSDictionary *dic = [DataJSON loadDataJSON:@"news_detail"];
    
    //拼接html字符串
    NSString *title = dic[@"title"];
    NSString *content = dic[@"content"];
    NSString *time = dic[@"time"];
    NSString *source = dic[@"source"];
    
    
    NSString *htlmString = [NSString stringWithFormat:pathData, title, content, time, source ];
    
    //加载页面
    [webView loadHTMLString:htlmString baseURL:nil];
    
    webView.scalesPageToFit = YES;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
