//
//  HeadCollectionView.h
//  TimeMovie
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *movieData;
@property (nonatomic, assign) NSInteger index;

@end
