//
//  HeadCell.m
//  TimeMovie
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HeadCell.h"

@implementation HeadCell

- (void)awakeFromNib {

}
-(void)setMovie:(MovieModel *)movie {
    _movie = movie;
    
    //赋值图片
    NSURL *url = [NSURL URLWithString:_movie.images[@"large"]];

    [_imageView sd_setImageWithURL:url];

}

@end
