//
//  BaseNavigationController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()


@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];

    //状态栏字体颜色
    UIApplication *app = [UIApplication sharedApplication];

    app.statusBarStyle = UIStatusBarStyleLightContent;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
