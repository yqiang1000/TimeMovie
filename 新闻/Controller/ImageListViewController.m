//
//  NewsSecondViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ImageLIstViewController.h"
#import "DataJSON.h"
#import "NewsImageModel.h"
#import "UIImageView+WebCache.h"
#import "BigImageViewController.h"

@interface NewsSecondViewController ()
{
    NSMutableArray *_newsImageNames;   //存放图片数组
}

@end

@implementation NewsSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图片新闻";
    [self loadData];
    //加载collection View界面
    [self createCollectionView];
    
    
}

#pragma mark - 创建collectionView
-(void)createCollectionView {

    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置水平竖直间隙
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    //设置单元格大小
    flowLayout.itemSize = CGSizeMake(60, 60);
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    UICollectionViewScrollDirectionHorizontal
    
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    //注册单元格
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
}

#pragma mark - collectionViewCell数据源
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    
//    return _newsImageNames.count;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return _newsImageNames.count;
    }
    return 10;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

//创建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    //拿到第item 个url
    NSURL *url = _newsImageNames[indexPath.item];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"moreScore"]];
    cell.backgroundView = image;
    
    return cell;
  
}


#pragma mark - 加载数据
-(void)loadData {
    //读取文件
    NSArray *array = [DataJSON loadDataJSON:@"image_list"];

    _newsImageNames = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in array) {
        //获取字典里的图片地址
        NSString *urlstring = dic[@"image"];
        //把地址转化为url
        NSURL *url = [NSURL URLWithString:urlstring];
        //把转化好的url储存
        [_newsImageNames addObject:url];
       
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"图片新闻滑动。。。");
}


#pragma mark - 选中图片跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    //跳转到大图浏览
    BigImageViewController *big = [[BigImageViewController alloc] init];
    
    //把图片数组传给bigViewController，这里_imageData 和 _newsImageNames 存放的数据是一样的
    big.imageData = _newsImageNames;

    big.indexPath = indexPath;
    
    big.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:big animated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
