//
//  PostCell.h
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModel.h"

@interface PostCell : UICollectionViewCell


@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UIImageView *smallImageVIew;
@property (strong, nonatomic) IBOutlet UILabel *titleCLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleELabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet StarView *starView;

@property (strong, nonatomic) MovieModel *movie;
-(void)filpCell;
-(void)cancerCell;

@end
