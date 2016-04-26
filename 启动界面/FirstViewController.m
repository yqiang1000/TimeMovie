//
//  FirstViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self createView];
    
}



-(void)createView {
    
    _scrollVIew.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_scrollVIew];
    
    //内容视图
    _scrollVIew.contentSize = CGSizeMake(kScreenWidth * 5, kScreenHeight);
    _scrollVIew.showsHorizontalScrollIndicator = NO;
    _scrollVIew.pagingEnabled = YES;
    
    for (int i = 1; i < 6 ; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_scrollVIew.frame];
        NSString *imageName = [NSString stringWithFormat:@"guide%d@2x",i];
        //创建图片
        imageView.image = [UIImage imageNamed:imageName];
        
        imageView.frame = CGRectMake((i - 1) * kScreenWidth, 0, kScreenWidth, kScreenHeight);
        //创建小图
        UIImageView *imageScroll = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-173/ 2)/2, 500, 173 / 2, 26 / 2)];
        NSString *imageScrollName = [NSString stringWithFormat:@"guideProgress%d@2x",i];
        
        imageScroll.image = [UIImage imageNamed:imageScrollName];
        
        [imageView addSubview:imageScroll];
        
        [_scrollVIew addSubview:imageView];
        
        if (i == 5 )
        {
            _button = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 100)/2 + kScreenWidth * (i - 1), 430, 100, 30)];
            [_button setTitle:@"马上体验" forState:UIControlStateNormal];
            
            [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [_button addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
            
            _button.backgroundColor = [UIColor colorWithRed:21 green:22 blue:25 alpha:0];
            
            [_scrollVIew addSubview:_button];
        }
    }
}

#pragma mark - 按钮跳转方法
-(void)jump:(UIButton *)button {
    
    //修改配置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
//    BOOL first = [userDefaults boolForKey:@"first"];
    
    [userDefaults setValue:@"YES" forKey:@"first"];
    

    //获取故事版
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //获取故事版上的第一个视图控制器
    UIViewController *view = [storyBoard instantiateInitialViewController];
    
    self.view.window.rootViewController = view;
    
    
    //设置跳转动画
    view.view.transform = CGAffineTransformMakeScale(0, 0);
    
    
    [UIView animateWithDuration:1.5
                     animations:^{
                         view.view.transform = CGAffineTransformIdentity;
                     }];
    
    UIApplication *app = [UIApplication sharedApplication];
    app.statusBarHidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
