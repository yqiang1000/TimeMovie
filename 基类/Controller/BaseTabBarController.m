//
//  BaseTabBarController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseTabBarButton.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface BaseTabBarController ()
{
    
    UIView *_newTabBar;//自定义的标签栏
    UIImageView *_selectedimage;//选中的图片

}

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNewTabBar];
 
}


-(void)setHidden:(BOOL)isHidden{
    _newTabBar.hidden = isHidden;
}

#pragma mark - 创建新的标签栏

-(void)creatNewTabBar {
    
    self.tabBar.hidden = YES;
    
    //创建新的标签栏视图
    _newTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
    //标签栏背景
    _newTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    [self.view addSubview:_newTabBar];
    
    //创建按钮
    //按钮宽度
    CGFloat buttonWidth = kScreenWidth/self.viewControllers.count;
    //按钮标题和图片
    NSArray *titles = @[@"电影",
                        @"新闻",
                        @"Top250",
                        @"影院",
                        @"更多"];
    
    NSArray *imageNames = @[@"movie_home",
                            @"msg_new",
                            @"start_top250",
                            @"icon_cinema",
                            @"more_setting"];
    
    //设置选中的图片
    _selectedimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth / self.viewControllers.count, 49)];
    
    _selectedimage.image = [UIImage imageNamed:@"selectTabbar_bg_all1@2x"];
    
    [_newTabBar addSubview:_selectedimage];
    
    
    for (int i = 0; i < self.viewControllers.count ; i++) {
        
        BaseTabBarButton *button = [[BaseTabBarButton alloc] initWithTitle:titles[i] imageName:imageNames[i] frame:CGRectMake(i * buttonWidth, 0, buttonWidth, 49)];
        
        [button addTarget:self action:@selector(tabBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 100 + i;
        
        [_newTabBar addSubview:button];
    }
 
}


#pragma mark - 标签按钮方法
-(void)tabBarButtonAction:(BaseTabBarButton *)sender {
    
    NSInteger index = sender.tag - 100;

    self.selectedIndex = index;
    
    //移动选中的图片
    [UIView animateWithDuration:.35 animations:^{
    
        _selectedimage.center = sender.center;
    
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
