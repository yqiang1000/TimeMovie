//
//  TopCell.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TopCell.h"


@implementation TopCell

-(void)setMovie:(MovieModel *)movie
{
    _movie = movie;
    // 填充数据
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_movie.images[@"medium"]]];
    _titleLabel.text = _movie.titleC;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f", _movie.rating];
    _starView.rating = _movie.rating;
    NSLog(@"movie.rating ==== %f",_movie.rating);
    NSLog(@"starView.rating ==%f",_starView.rating);
    
}



@end
