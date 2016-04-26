//
//  BigImageViewController.h
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BigImageViewController : BaseViewController
<UICollectionViewDataSource,UICollectionViewDelegate>

@property(strong,nonatomic) NSArray *imageData;
@property(strong,nonatomic) NSIndexPath *indexPath;
@property(strong,nonatomic) NSNotificationCenter *noti;
@end
