//
//  BaseViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTabBarController.h"

@interface BaseViewController ()
{
    
    UILabel *_titleLabel;
    BOOL _isHidden;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:26 weight:1];
    
    self.navigationItem.titleView = _titleLabel;
    

    //设置背景颜色
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
}

#pragma mark - 设置导航栏标题
-(void)setTitle:(NSString *)title {
    
    [super setTitle:title];
    
    _titleLabel.text = title;
 
}


#pragma mark - 显示或者隐藏标签栏
-(void)viewWillAppear:(BOOL)animated
{
    if (_isHidden) {
        //隐藏标签栏
        BaseTabBarController *tabBar = (BaseTabBarController *) self.tabBarController;
        [tabBar setHidden:YES];
    
    }
    else
    {
        //显示标签栏
        BaseTabBarController *tabBar = (BaseTabBarController *) self.tabBarController;
        [tabBar setHidden:NO];
    }
  
}
-(void)viewWillDisappear:(BOOL)animated
{
    //显示标签栏
    BaseTabBarController *tabBar = (BaseTabBarController *) self.tabBarController;
    [tabBar setHidden:NO];
}

-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed {
    _isHidden = hidesBottomBarWhenPushed;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
