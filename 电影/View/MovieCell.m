//
//  MovieCell.m
//  TimeMovie
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"


@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setMovie:(MovieModel *)movie{

    _movie = movie;
    _titleCLabel.text = _movie.titleC;

    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_movie.rating];
    _yearLabel.text = [NSString stringWithFormat:@"上映年份:%@",_movie.year];
    
    
    //从网络获取图片
    NSString *path = _movie.images[@"small"];

    NSURL *url = [NSURL URLWithString:path];

    [_imagView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"moreScore"]];
    //创建星星视图
    _starVIew.rating = _movie.rating;

 
}


//#pragma mark - 创建星星视图
//-(void)creatStar {
//    //黄星星占整个_starView 的宽度
//    CGFloat yellowViewWidth = _movie.rating / 10 *132;
//    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 34)];
//    yellowView.backgroundColor = [UIColor blackColor];
//    
//    _starView.backgroundColor  = [UIColor blackColor];
//    
//    for (int i = 0; i < 5; i++) {
//        
//        //创建黑星星
//        UIImageView *grayImage = [[UIImageView alloc] initWithFrame:CGRectMake(i *26, 4, 26, 26)];
//        grayImage.image = [UIImage imageNamed:@"gray" ];
//        [_starView addSubview:grayImage];
//        
//        //创建黄星星
//        yellowView.frame = CGRectMake(0, 0, yellowViewWidth, 34);
//        
//        UIImageView *yellowImage = [[UIImageView alloc] initWithFrame:CGRectMake(i *26, 4, 26, 26)];
//        yellowImage.image = [UIImage imageNamed:@"yellow@2x" ];
//        
//        yellowView.clipsToBounds = YES;
//  
//        [yellowView addSubview:yellowImage];
//      
//        [_starView addSubview:yellowView];
//
//    };
// 
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
