//
//  PostCell.m
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "PostCell.h"
#import "UIImageView+WebCache.h"


@implementation PostCell

- (void)awakeFromNib {
    
    
    
    
}

#pragma mark - 赋值
-(void)setMovie:(MovieModel *)movie {
    _movie = movie;
    
    _titleCLabel.text = _movie.titleC;
    _titleELabel.text = _movie.titleE;
    _starView.rating = _movie.rating;
    _yearLabel.text = _movie.year;
    
    
    //设置图片
    NSURL *url = [NSURL URLWithString:_movie.images[@"large"]];
    [_bigImageView sd_setImageWithURL:url];
    [_smallImageVIew sd_setImageWithURL:url];

}
#pragma mark - 翻转单元格
-(void)filpCell {
    
    [UIView transitionWithView:self
                      duration:.35
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        _bigImageView.hidden = !_bigImageView.hidden;
                    }
                    completion:nil];
 
}


#pragma mark - 取消翻转
-(void)cancerCell {
    
    [UIView transitionWithView:self
                      duration:.35
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        _bigImageView.hidden = NO;
                    }
                    completion:nil];
}
@end
