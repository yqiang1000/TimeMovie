//
//  MovieCommentModel.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseModel.h"

@interface MovieCommentModel : BaseModel

@property (nonatomic, strong) NSString *userImage;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, assign) CGFloat rating;
@property (nonatomic, strong) NSString *comment;

@property (nonatomic, assign) BOOL isShow;

-(id)initWithContentDic:(NSDictionary *)dictionary;

+(id)commentModelWithContentDic:(NSDictionary *)dictionary;

@end
