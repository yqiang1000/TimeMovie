//
//  HeadCollectionView.m
//  TimeMovie
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HeadCollectionView.h"
#import "HeadCell.h"

@implementation HeadCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    //创建布局对像
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(frame.size.width / 4 - 10, 85);
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(35, (frame.size.width - (frame.size.width / 4 - 10))/ 2, 0, (frame.size.width - (frame.size.width / 4 - 10))/ 2);

    //创建collectionView
    self = [super initWithFrame:frame collectionViewLayout:layout ];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    
        self.showsHorizontalScrollIndicator = NO;
        self.index = NO;
        
        //注册单元格
        UINib *nib = [UINib nibWithNibName:@"HeadCell" bundle:[NSBundle mainBundle]];
        
        
        [self registerNib:nib forCellWithReuseIdentifier:@"headCell"];
        
        
    }
    return self;
}
#pragma mark - 创建单元格
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return _movieData.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    cell.movie = _movieData[indexPath.item];
    
    
    return cell;

}


#pragma mark - 翻页效果
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    
    // 1.获取当前的偏移量
    CGFloat xOffset = targetContentOffset->x;
    // 2.计算当前的页码
    xOffset -= (scrollView.width / 4 - 10) / 2;
    
    NSInteger index = xOffset / (scrollView.width / 4);
    
    if( xOffset > 0 ){
        index += 1 ;
    }
    //KVO观察者，只能响应set方法
    self.index = index;
    
    xOffset = (scrollView.width / 4) * index;
    
    targetContentOffset->x = xOffset;
    
    NSLog(@"%li",index);
    
    
}






@end
