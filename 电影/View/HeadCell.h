//
//  HeadCell.h
//  TimeMovie
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface HeadCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) MovieModel *movie;

@end
