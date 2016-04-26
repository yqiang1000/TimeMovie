//
//  NewsCell.h
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;

@property (strong, nonatomic) IBOutlet UIImageView *typeImage;

@end
