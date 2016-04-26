//
//  MovieCommentCell.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieCommentCell.h"

@implementation MovieCommentCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setCommentModel:(MovieCommentModel *)commentModel
{
    _commentModel = commentModel;
    
    NSURL *url = [NSURL URLWithString:commentModel.userImage];
    //图片
    [_userImage sd_setImageWithURL:url];
    
    _rating.text = [NSString stringWithFormat:@"%.1f",commentModel.rating ];
    
    _nickName.text = commentModel.nickName;
    _comment.text = commentModel.comment;

    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
