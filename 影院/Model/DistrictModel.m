//
//  DistrictModel.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DistrictModel.h"

@implementation DistrictModel

-(id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        
        self.districtID = jsonDic[@"id"];
        
        _cinemas = [[NSMutableArray alloc] init];
        

    }
    return self;
 
}




@end
