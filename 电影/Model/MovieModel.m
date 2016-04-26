//
//  MovieModel.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieModel.h"
#import <UIKit/UIKit.h>
@implementation MovieModel

-(id)initWithContentDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if ( self ) {
        
//        NSDictionary *subject = dictionary[@"subject"];
        _titleC = dictionary[@"title"];
        _titleE = dictionary[@"original_title"];
    
        //获取评分
        NSDictionary *dic = dictionary[@"rating"];
        NSNumber *num = dic[@"average"];
        _rating = [num floatValue];
 
        //获取图片
        _images = dictionary[@"images"];
        
        _year = dictionary[@"year"];
        
        
        
    }
    return self;
}




//- (id)initWithContentsOfDictionary:(NSDictionary *)dictionary
//{
//    self = [super init];
//    if (self)
//    {
//        NSDictionary *subject = dictionary[@"subject"];
//        // 中文标题
//        _titleC = subject[@"title"];
//        // 英文标题
//        _titleE = subject[@"original_title"];
//        // 评分
//        NSDictionary *ratingDic = subject[@"rating"];
//        NSNumber *number = ratingDic[@"average"];
//        _rating = [number floatValue];
//        // 图片
//        _images = subject[@"images"];
//        // 上映年份
//        _year = subject[@"year"];
//        
//    }
//    
//    return self;
//}




+(id)movieWithContentDictionary:(NSDictionary *)dictionary {
    
    return [[MovieModel alloc] initWithContentDictionary:dictionary];
    
}

@end
