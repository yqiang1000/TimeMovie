//
//  MovieDetailModel.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

-(id)initContentWithDic:(NSDictionary *)dictionary{
 
    self = [super init];
    if (self) {
        _image = dictionary[@"image"];
        _titleCn = dictionary[@"titleCn"];
        
        //导演
        NSArray *array1 = dictionary[@"directors"];
        _directors = @"导演:";
        for (NSString *str in array1) {
            _directors = [_directors stringByAppendingFormat:@"%@",str];
        }
        
        
        //演员
        NSArray *array2 = dictionary[@"actors"];
        _actors = @"主演:";
        for (NSString *str in array2) {
            _actors = [_actors stringByAppendingFormat:@"%@ ",str];
        }
        
        
        //类型
        NSArray *array3 = dictionary[@"type"];
        _type = @"类型:";
        for (NSString *str in array3) {
            _type = [_type stringByAppendingFormat:@"%@ ",str];
        }
        
        
        //年份 ＝ 中国 ＋ 时间
        NSDictionary *dic = dictionary[@"release"];
        NSString *china = dic[@"location"];
        NSString *date = dic[@"date"];
        
        _year = [NSString stringWithFormat:@"%@ %@",china,date];
        
        
        //滑动视图图片
        _images = dictionary[@"images"];
        
    }
    return self;
  
}




+(id)detailContentWithDic:(NSDictionary *)dictionary{
    
    return [[MovieDetailModel alloc] initContentWithDic:dictionary];
    
    
}

@end
