//
//  BigImageCell.h
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigImageViewController.h"

@interface BigImageCell : UICollectionViewCell<UIScrollViewDelegate>

{
    UIScrollView *_scrollView;  //底层滑动视图，用于捏合图片
    
    UIImageView *_imageView;    //图片的视图
    
    NSTimer *_timer;
    
    NSNotificationCenter *_noti;
    
//    BigImageViewController *_bigView;
}


@property(nonatomic , strong) NSURL *imageUrl;
-(void)backImageZoomingScale;


@end
