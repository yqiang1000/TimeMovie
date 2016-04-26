//
//  BaseTabBarButton.h
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarButton : UIButton

/*
 * 初始化方法
 * title 按钮下部的文字
 * imageName 按钮上部图片名
 */
- (id)initWithTitle:(NSString *)title
          imageName:(NSString *)imageName
              frame:(CGRect)frame;

@end