//
//  PostCollectionView.m
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCell.h"

@interface PostCollectionView()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation PostCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(frame.size.width * 0.6, frame.size.height * 0.6);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, frame.size.width * 0.2, 0, frame.size.width * 0.2);
  
    //创建collectionView
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.index = NO;
        //隐藏滑块
        self.showsHorizontalScrollIndicator = NO;

        //注册单元格
        UINib *nib = [UINib nibWithNibName:@"PostCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"postCell"];
        
    
    }
    return self;
}

#pragma mark - 创建单元格
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _movieData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PostCell *cell = [self dequeueReusableCellWithReuseIdentifier:@"postCell" forIndexPath:indexPath];
    
    cell.movie = _movieData[indexPath.item];
    
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
    
}

#pragma mark - 停止滑动动作
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    
    // 1.获取当前的偏移量
    CGFloat xOffset = targetContentOffset->x;
    NSLog(@"offset1 >> %f",xOffset);
    // 2.计算当前的页码
    xOffset -= scrollView.width * 0.3;
    NSLog(@"offset2 >> %f",xOffset);
    NSInteger index = xOffset / (self.bounds.size.width * 0.6 + 10);

    if( xOffset > 0 ){
        index += 1 ;
    }
    //KVO观察者，只能响应set方法
    self.index = index;
    
    xOffset = (self.bounds.size.width * 0.6 + 10) * index;
    
    targetContentOffset->x = xOffset;
    
    NSLog(@"%li",index);
    
    
}

#pragma mark - 选中单元格翻转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    //判断选中的单元格是否在视图中间
    //YES 翻转
    //NO  移到中间翻转
    
//    //正中间的图片索引
    NSInteger index = collectionView.contentOffset.x / (collectionView.width * 0.6 +10);

    
    if ( index == indexPath.item) {
        //YES
        // 1.获取单元格
        PostCell *postCell = (PostCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        // 2.翻转单元格
        [postCell filpCell];
    }
    else
    {
        //NO
        //显示选中的单元格
        [collectionView scrollToItemAtIndexPath:indexPath
                               atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

        //将前一个单元格取消翻转
        PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
  
        //用set方法传入index
        self.index = indexPath.item;
        
            // 2.翻转单元格
        [cell cancerCell];
    }
    
}


-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    // 1.获取单元格
    PostCell *postCell = (PostCell *)cell;
   // 2.翻转单元格
    [postCell cancerCell];
}



@end
