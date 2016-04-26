//
//  CinemaCell.m
//  TimeMovie
//
//  Created by mac on 15/8/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//
/*
 @property (nonatomic, copy) NSString *lowPrice;
 @property (nonatomic, copy) NSString *grade;
 @property (nonatomic, copy) NSString *address;
 @property (nonatomic, copy) NSString *name;
 @property (nonatomic, copy) NSString *districtId;
 @property (nonatomic, copy) NSString *isSeatSupport;
 @property (nonatomic, copy) NSString *isCouponSupport;
 @property (nonatomic, copy) NSString *isImaxSupport;
 @property (nonatomic, copy) NSString *isGroupBuySupport;
 */
#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setCinema:(CinemaModel *)cinema
{
    _cinema = cinema;
    _cinemaLabel.text = _cinema.name;
    _addressLabel.text = _cinema.address;
    _ratingLabel.text = _cinema.grade;
    
    if (_cinema.lowPrice.length == 0) {
        
        _lowPriceLabel.text = @"暂无报价";
        
    }else {
        
        _lowPriceLabel.text = [NSString stringWithFormat:@"¥%@",_cinema.lowPrice];
        
    }
    
    //放到数组里，用for循环判断是否为0
    //为0，不显示
    //不为零，则显示
    
//    NSArray *array = @[_cinema.isSeatSupport,_cinema.isGroupBuySupport,_cinema.isCouponSupport];
//    NSArray *array2 = @[_cinemaSeat,_cinemaGroup,_cinemaCouponMark];
    
//    for (int i = 0 , j = 0 ;  i < 3; i++,j++) {
//        if ([array[i] isEqualToString:@"1"]) {
//            _view = array2[i];
//            _view.hidden = NO;
//            _view.frame = CGRectMake(8 + j * 25, 57 , 17, 17);
//
//        }
//        else{
//            j--;
//            _view.hidden = YES;
//        }
//    }
    
    _cinemaSeat.hidden = [_cinema.isSeatSupport isEqualToString:@"0"];
    _cinemaGroup.hidden = [_cinema.isGroupBuySupport isEqualToString:@"0"];
    _cinemaCouponMark.hidden = [_cinema.isCouponSupport isEqualToString:@"0"];
    
    
    _imax.hidden = [_cinema.isImaxSupport isEqualToString:@"0"];

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
