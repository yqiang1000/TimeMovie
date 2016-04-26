//
//  MovieModel.h
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface MovieModel : NSObject

@property(nonatomic , copy)NSString *titleC;   //电影中文名
@property(nonatomic , copy)NSString *titleE;   //电影英文名
@property(nonatomic , assign)CGFloat rating;  //评分
@property(nonatomic , copy)NSString *year;     //年月
@property(nonatomic , copy)NSDictionary *images;   //图片


-(id)initWithContentDictionary:(NSDictionary *)dictionary;
+(id)movieWithContentDictionary:(NSDictionary *)dictionary;


@end
