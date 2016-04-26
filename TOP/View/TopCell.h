//
//  TopCell.h
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModel.h"

@interface TopCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet StarView *starView;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;


@property(strong ,nonatomic) MovieModel *movie;

@end
