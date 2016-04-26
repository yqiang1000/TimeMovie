//
//  BigImageCell.m
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BigImageCell.h"


@implementation BigImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createView];
    }
    return self;
}


#pragma mark - 创建滑动视图
-(void)_createView {
    
    //创建滚动视图
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = self.frame.size;
    //放大倍数
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 3;
    
    
    _scrollView.delegate = self;
    //添加到collection视图上
    [self.contentView addSubview:_scrollView];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_imageView];
    
    //创建手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    [_imageView addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2Action:)];
    tap2.numberOfTapsRequired = 2;
    tap2.numberOfTouchesRequired = 1;
    
    [_imageView addGestureRecognizer:tap2];
    
    //打开图片的点击事件
    _imageView.userInteractionEnabled = YES;

}


#pragma mark - 缩放方法
-(void)tapAction:(UITapGestureRecognizer *)tap {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tap1Action:) userInfo:nil repeats:NO];

}
-(void)tap1Action:(UITapGestureRecognizer *)tap {

    NSLog(@"单击一次");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"oneTouch" object:self];

}

-(void)tap2Action:(UITapGestureRecognizer *)tap {
    NSLog(@"双击一次");
    
    [_timer invalidate];
    

    if (_scrollView.zoomScale == 1) {
        _scrollView.zoomScale = 3;
    }
    else{
        _scrollView.zoomScale = 1;
    }
    
}

//返回原比例
- (void)backImageZoomingScale
{
    NSLog(@"111111");
    // 滑动视图的缩放比例
    [_scrollView setZoomScale:1];
}

//回传缩放视图
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)setImageUrl:(NSURL *)imageUrl
{
    _imageUrl = imageUrl;
    [_imageView sd_setImageWithURL:_imageUrl];
}

@end
