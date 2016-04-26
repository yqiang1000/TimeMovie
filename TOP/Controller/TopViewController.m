//
//  TopViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TopViewController.h"
#import "DataJSON.h"
#import "MovieModel.h"
#import "TopCell.h"
#import "MovieDetailController.h"

@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    NSMutableArray *_topData;
}
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top250";
    
    //加载数据
    [self loadData];
    
    
}

#pragma mark - 设置collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _topData.count;

}
#pragma mark - 创建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    
    MovieModel *movie = _topData[indexPath.item];
    
    cell.movie = movie;
    
    return cell;
    
}
#pragma mark - 设置单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat x = (kScreenWidth - 10 *4)/3;
    CGFloat y = x * 1.5;
    return CGSizeMake(x, y);

}

#pragma mark - 加载数据
-(void)loadData {
    
    NSDictionary *dic = [DataJSON loadDataJSON:@"top250"];
    _topData = [[NSMutableArray alloc] init];
    
    for (NSDictionary *d in dic[@"subjects"]) {
        MovieModel *movie = [[MovieModel alloc] initWithContentDictionary:d];
        
        [_topData addObject:movie];
    }
}
#pragma mark - 选中单元格跳转界面
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MovieDetailController *movieDetailView = [storyBoard instantiateViewControllerWithIdentifier:@"detilViewController"];
    [self.navigationController pushViewController:movieDetailView animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
