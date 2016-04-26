//
//  MovieDetailView.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"

@interface MovieDetailView : UIView<UIScrollViewDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleCn;
@property (strong, nonatomic) IBOutlet UILabel *directors;
@property (strong, nonatomic) IBOutlet UILabel *actors;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet UIScrollView *images;
@property (strong, nonatomic) NSArray *imageNames;

@property (strong, nonatomic) IBOutlet UIButton *videoButton;


@property (strong, nonatomic) MovieDetailModel *detailModel;

@property (weak, nonatomic) UINavigationController *navigationController;

@end
