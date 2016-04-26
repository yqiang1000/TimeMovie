//
//  StarView.m
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "StarView.h"

@interface StarView(){
    
    UIView *_grayView;
    UIView *_yellowView;
    
}

@end
@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createStarView];
    }
    return self;
}

// 当视图从 xib 故事版中创建时 调用
- (void)awakeFromNib
{
    [self createStarView];
}

- (void)createStarView{
    
    UIImage *grayImg = [UIImage imageNamed:@"gray"];
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    
    //设置灰色视图
    _grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 17.5 * 5, 17)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];

    //设置放大倍数
    CGAffineTransform trans = CGAffineTransformMakeScale(self.frame.size.width / 17.5 / 5, self.frame.size.height / 17);
    
    _grayView.transform = trans;
    [self addSubview:_grayView];
    
    
    //设置黄色视图
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 17.5 * 5, 17)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    _yellowView.transform = trans;
    [self addSubview:_yellowView];
    
    //中心点设置
    CGPoint selfCenterPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    _yellowView.center = selfCenterPoint;
    _grayView.center = selfCenterPoint;
    
}

- (void)setRating:(CGFloat)rating{
    _rating = rating;
    _yellowView.width = _grayView.width * rating / 10;
}

@end
