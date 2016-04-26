//
//  MovieCell.h
//  TimeMovie
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "StarView.h"

@interface MovieCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *imagView;

@property (strong, nonatomic) IBOutlet UILabel *titleCLabel;

@property (strong, nonatomic) IBOutlet StarView *starVIew;


@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property(nonatomic,strong)NSMutableArray *blackStars;

@property (nonatomic ,strong)MovieModel *movie;




@end
