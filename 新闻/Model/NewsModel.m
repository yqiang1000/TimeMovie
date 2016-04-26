//
//  NewsModel.m
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

//复写方法
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];

    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    
    [mapDic setObject:@"newsID" forKey:@"id"];
 
    return mapDic;
}

@end
