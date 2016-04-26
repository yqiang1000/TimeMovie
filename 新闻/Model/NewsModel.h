//
//  NewsModel.h
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"



@interface NewsModel :BaseModel

@property(nonatomic , strong) NSNumber *newsID;
@property(nonatomic , strong) NSNumber *type;   // 新闻的类型 0普通 1图片 2视频
@property(nonatomic , copy) NSString *title;
@property(nonatomic , copy) NSString *summary;
@property(nonatomic , copy) NSString *image;

@end