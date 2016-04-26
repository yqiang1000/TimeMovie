//
//  MovieCommentModel.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieCommentModel.h"

@implementation MovieCommentModel

-(id)initWithContentDic:(NSDictionary *)dictionary{
    
    self = [super init];
    
    if (self) {
        _userImage = dictionary[@"userImage"];
        
        
        NSNumber *rating = dictionary[@"rating"];
        
        _rating = [rating floatValue];
        
        _comment = dictionary[@"content"];
        
        _nickName = dictionary[@"nickname"];
        
        
    }
    return self;

}
+(id)commentModelWithContentDic:(NSDictionary *)dictionary {
    
    
    return [[MovieCommentModel alloc]initWithContentDic:dictionary];
}

@end
