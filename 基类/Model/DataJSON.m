//
//  DataJSON.m
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DataJSON.h"

@implementation DataJSON


+(id)loadDataJSON:(NSString *)name
{
    //文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    //文件
    NSData *data = [NSData dataWithContentsOfFile:path];
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableLeaves
                                                error:nil];
    return json;
    
}

@end
