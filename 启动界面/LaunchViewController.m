//
//  LaunchViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "LaunchViewController.h"
#import "BaseTabBarController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTimer];

}

-(void)viewWillAppear:(BOOL)animated{
    
    //隐藏导航栏
    UIApplication *app = [UIApplication sharedApplication];
    
    [app setStatusBarStyle:UIStatusBarStyleLightContent];
    
    app.statusBarHidden = YES;
}

#pragma mark - 创建定时器
-(void)createTimer {
    
    [NSTimer scheduledTimerWithTimeInterval:.02
                                     target:self
                                   selector:@selector(viewAction:)
                                   userInfo:nil
                                    repeats:YES];
 
    
}

#pragma mark - 创建动画
-(void)viewAction:(NSTimer *)timer {

    static NSInteger i = 1;
    UIView *view = (UIView *)[self.view viewWithTag:i];
    view.hidden = NO;
    i++;
    if (i == 25) {
        [timer invalidate];
        [self performSelector:@selector(jumpMainViewController) withObject:nil afterDelay:.35];
    }
}

#pragma mark - 结束跳转到主界面
-(void)jumpMainViewController {
    
    //获取故事版
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    //获取故事版上的第一个ViewConrtoller
    UIViewController *viewController = [storyBoard instantiateInitialViewController];
    
    self.view.window.rootViewController = viewController;
    
    //设置跳转动画
    viewController.view.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:1.5 animations:^{
        viewController.view.transform = CGAffineTransformIdentity;
    }];
    
    UIApplication *app = [UIApplication sharedApplication];
    app.statusBarHidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
