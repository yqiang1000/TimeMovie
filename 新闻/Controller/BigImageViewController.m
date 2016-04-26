//
//  BigImageViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BigImageViewController.h"
#import "DataJSON.h"
#import "BigImageCell.h"

@interface BigImageViewController ()
{
    
//    NSMutableArray *_bigImages;
    
    UICollectionView *_collectionView;
    
    BOOL _isHidden;
}
@end

@implementation BigImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"大图浏览";
    //创建视图
    [self createView];
    
//    [self loadData];
    
    //根据传过来的索引，来显示该单元格
    [_collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
}


#pragma mark - 创建视图
-(void)createView {
    
    //创建布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //x,y 的间距
    layout.minimumInteritemSpacing = 10 ;
    layout.minimumLineSpacing = 10;
    
    //布局大小
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight-64);
    //滑动方向,x方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置边界间隙
    layout.sectionInset = UIEdgeInsetsMake(-15,0,0,0);
    
    
    //创建collection视图
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth+10, kScreenHeight-64) collectionViewLayout:layout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    //设置分页效果
    _collectionView.pagingEnabled = YES;
    
    //隐藏滑块
    _collectionView.showsHorizontalScrollIndicator = NO;

    [self.view addSubview:_collectionView];

    // 注册单元格
    [_collectionView registerClass:[BigImageCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    
    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                selector:@selector(naviHidden)
                    name:@"oneTouch"
                  object:nil];
    

}
//接收通知执行方法
-(void)naviHidden {
    NSLog(@"hello");
    _isHidden = !_isHidden;
    
   
    [self.navigationController setNavigationBarHidden:_isHidden animated:YES];
    UIApplication *app = [UIApplication sharedApplication];
        
    [app setStatusBarHidden:_isHidden withAnimation:UIStatusBarAnimationNone];
        
    app.statusBarStyle = UIStatusBarStyleLightContent;
    
    
}
//移除通知
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _imageData.count;
}
//创建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BigImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor blackColor];
    
    //给单元格图片
    cell.imageUrl = _imageData[indexPath.item];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取单元格 强制类型转换
    BigImageCell *big = (BigImageCell *)cell;
    // 将单元格中的图片缩放还原
    [big backImageZoomingScale];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
