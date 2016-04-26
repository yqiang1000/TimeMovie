//
//  CinemaModel.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseModel.h"

@interface CinemaModel : BaseModel

@property (nonatomic, copy) NSString *lowPrice;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *districtId;
@property (nonatomic, copy) NSString *isSeatSupport;
@property (nonatomic, copy) NSString *isCouponSupport;
@property (nonatomic, copy) NSString *isImaxSupport;
@property (nonatomic, copy) NSString *isGroupBuySupport;


@end
