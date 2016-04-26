//
//  BaseTabBarButton.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseTabBarButton.h"

@implementation BaseTabBarButton

- (id)initWithTitle:(NSString *)title imageName:(NSString *)imageName frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 创建图片和label
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 20) / 2, 8, 20, 22)];
        imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:imageView];
        
        // 设置图片的拉伸模式
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, frame.size.width, 15)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    
    return self;
}

@end
