//
//  DistrictModel.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseModel.h"

@interface DistrictModel : BaseModel


@property (nonatomic, copy) NSString *name ;
@property (nonatomic, copy) NSString *districtID ;
@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, strong) NSMutableArray *cinemas;


@end
