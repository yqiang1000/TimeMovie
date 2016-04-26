//
//  CinemaCell.h
//  TimeMovie
//
//  Created by mac on 15/8/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cinemaLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *lowPriceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cinemaSeat;
@property (strong, nonatomic) IBOutlet UIImageView *cinemaCouponMark;
@property (strong, nonatomic) IBOutlet UIImageView *cinemaGroup;
@property (strong, nonatomic) IBOutlet UIImageView *imax;


@property (nonatomic, strong) CinemaModel *cinema;

@end
