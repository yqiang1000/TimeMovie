//
//  MovieDetailView.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//
/*
 @property (strong, nonatomic) IBOutlet UIImageView *imageView;
 @property (strong, nonatomic) IBOutlet UILabel *titleCn;
 @property (strong, nonatomic) IBOutlet UILabel *directors;
 @property (strong, nonatomic) IBOutlet UILabel *actors;
 @property (strong, nonatomic) IBOutlet UILabel *type;
 @property (strong, nonatomic) IBOutlet UILabel *year;
 @property (strong, nonatomic) IBOutlet UIScrollView *images;
 */
#import "MovieDetailView.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation MovieDetailView

-(void)setDetailModel:(MovieDetailModel *)detailModel
{
    
    _detailModel = detailModel;
    
    NSURL *url = [NSURL URLWithString:_detailModel.image];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
   
    _imageView.image = image;
    _imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonAction:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [_imageView addGestureRecognizer:tap];

    _titleCn.text = _detailModel.titleCn;
    _directors.text = _detailModel.directors;
    _actors.text = _detailModel.actors;
    _type.text = _detailModel.type;
    _year.text = _detailModel.year;
    
    
    
    //创建滑动视图
    _images.delegate = self;
    //内容大小
    _imageNames = _detailModel.images;
    _images.scrollEnabled = YES;
    
    _images.layer.borderWidth = 3;
    _images.layer.borderColor = [UIColor yellowColor].CGColor;
    _images.showsHorizontalScrollIndicator = NO;
    _images.contentSize = CGSizeMake(60 * 6, 55);
    for (int i = 0; i < 6 ; i ++) {
        UIImageView *image = [[UIImageView alloc] init];
        
        [image sd_setImageWithURL:[NSURL URLWithString:_imageNames[i]]];
        image.frame = CGRectMake(60 * i, 2, 55, 55);
        
        image.backgroundColor = [UIColor yellowColor];
        
        [_images addSubview:image];
    }
}

-(void)buttonAction:(UIButton *)button {
    
    
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/06/21/mp4/120621104820876931.mp4"]];
    
    [self.navigationController pushViewController:player animated:YES];
    NSLog(@"hello");
    
}




@end
