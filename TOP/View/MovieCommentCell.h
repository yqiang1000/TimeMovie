//
//  MovieCommentCell.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCommentModel.h"
@interface MovieCommentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *comment;

@property (strong, nonatomic) MovieCommentModel *commentModel;

@end
