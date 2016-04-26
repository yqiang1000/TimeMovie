//
//  MovieViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModel.h"
#import "MovieCell.h"
#import "DataJSON.h"
#import "PostCollectionView.h"
#import "HeadCollectionView.h"

@interface MovieViewController ()
{
    //中间视图
    UITableView *_listView;   //列表视图
    UIView *_postView;        //海报视图
    
    UIButton *_rightButton;   //翻转按钮
    
    NSMutableArray *_movieData;

    UIView *_headView ;       //海报视图的头视图
    
    UIButton *_updownButton;  //上下缩按钮
    
    UIView *_backGround;
    UIImageView *_lightImage1;
    UIImageView *_lightImage2;
    
    PostCollectionView *_postCollectionView;  //海报视图上的collectionView
    
    HeadCollectionView *_headCollectionView;  //头视图上的collectionView
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"北美榜";
    
    //创建翻转按钮
    [self createRightItem];
    //创建中间视图
    [self createView];
    //加载数据
    [self loadData];
    
    [self createPostView];
    
    [self createKVO];
    
    
}
#pragma mark - 加载数据
-(void)loadData{

    NSDictionary *dic = [DataJSON loadDataJSON:@"us_box"];
    
    NSDictionary *subjects = dic[@"subjects"];
    _movieData = [[NSMutableArray alloc] initWithCapacity:dic.count];
    
    for ( NSDictionary *dictionary in subjects ) {
        //创建每一个movie 添加到_movieData
        MovieModel *movie = [MovieModel movieWithContentDictionary: dictionary[@"subject"]];
        [_movieData addObject:movie];
    }
    

}

#pragma mark - 创建翻转按钮
-(void)createRightItem {
    
    //右侧按钮
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];

    [_rightButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    
    [_rightButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateSelected];
    
    [_rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - 创建_listView;
-(void)createView{
    
    //列表视图
    _listView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _listView.delegate = self;
    _listView.dataSource = self;
    _listView.backgroundColor = [UIColor blackColor];
    _listView.hidden = NO;
    [self.view addSubview:_listView];
    
    //海报视图
    _postView = [[UIView alloc] initWithFrame:self.view.bounds];
    _postView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_postView];
    _postView.hidden = YES;

}

#pragma mark - 创建postView;
-(void)createPostView  {
    
    //创建collectionView
    _postCollectionView = [[PostCollectionView alloc] initWithFrame:_postView.bounds];
    
    //传递数据
    _postCollectionView.movieData = _movieData;
 
    [_postView addSubview:_postCollectionView];
    
    //创建遮罩视图
    _backGround = [[UIView alloc] initWithFrame:_postView.bounds];
    _backGround.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
    
    _backGround.hidden = YES;
    [_postView addSubview:_backGround];
    
    //头视图
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 - 100, kScreenWidth, 130)];
    _headView.backgroundColor = [UIColor clearColor];
    
    [_postView addSubview:_headView];
    
    //背景图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_headView.bounds];
    //拉伸图片
    UIImage *bjimage = [UIImage imageNamed:@"indexBG_home"];
    
    bjimage = [bjimage stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    
    imageView.image = bjimage;
    
    [_headView addSubview:imageView];
    
    //创建按钮
    _updownButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 20)];
    
    _updownButton.center = CGPointMake(kScreenWidth / 2, 120);
    
    //按钮的选中状态
    [_updownButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_updownButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
 
    //按钮方法
    [_updownButton addTarget:self action:@selector(headViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_headView addSubview:_updownButton];
    
    //创建下滑手势
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downView)];
    swipeDown.numberOfTouchesRequired = 1;
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [_postView addGestureRecognizer:swipeDown];
    
    
    //创建上滑手势
    UISwipeGestureRecognizer *swipeUP = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upView)];
    swipeUP.numberOfTouchesRequired = 1;
    swipeUP.direction = UISwipeGestureRecognizerDirectionUp;
    [_postView addGestureRecognizer:swipeUP];
    
    //创建头视图上的滑动视图
    _headCollectionView = [[HeadCollectionView alloc] initWithFrame:_headView.frame];
    //传数据
    _headCollectionView.movieData = _movieData;
    
    _headCollectionView.backgroundColor = [UIColor redColor];
    
    [_headView addSubview:_headCollectionView];
    
    
    //创建灯光视图
    CGFloat xlightWidth1 = (_headView.frame.size.width /2 -124)/ 2;
    CGFloat xlightWidth2 = (_headView.frame.size.width /2 -124)/ 2 + (_headView.frame.size.width / 2);
    
    _lightImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(xlightWidth1, -10, 124, 204)];
    _lightImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(xlightWidth2, -10, 124, 204)];
    _lightImage1.image = [UIImage imageNamed:@"light"];
    _lightImage2.image = [UIImage imageNamed:@"light@2x"];
    _lightImage1.hidden = YES;
    _lightImage2.hidden = YES;
    [_headView addSubview:_lightImage1];
    [_headView addSubview:_lightImage2];

}

#pragma mark - 创建下拉按钮的动作
-(void)headViewAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self downView];
    }
    else{
        [self upView];
    }
}

-(void)downView{

    [UIView animateWithDuration:0.35 animations:^{
        _lightImage1.hidden = NO;
        _lightImage2.hidden = NO;
        _updownButton.selected = YES;
        _headView.top = 64;
        _backGround.hidden = NO;
    }];
}

-(void)upView {
    
    [UIView animateWithDuration:0.35 animations:^{
        _lightImage1.hidden = YES;
        _lightImage2.hidden = YES;
        _updownButton.selected = NO;
        _headView.top = 64-100;
        _backGround.hidden = YES;
    }];
}


#pragma mark - 创建单元格
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _movieData.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MovieCell";
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil] lastObject];
        
    }
    cell.movie = _movieData[indexPath.row];
    
    return cell;
    
}


#pragma mark - list按钮方法
-(void)buttonAction:(UIButton *)sender {
    
    UIViewAnimationOptions option = _rightButton.selected ? UIViewAnimationOptionTransitionFlipFromLeft :UIViewAnimationOptionTransitionFlipFromRight;
    
    [self FlipView:self.view options:&option];
    [self FlipView:self.view options:&option];
    
    _rightButton.selected = !_rightButton.selected;
    _postView.hidden = !_postView.hidden;
    _listView.hidden = !_listView.hidden;

}


#pragma mark - 创建视图翻转方法
-(void)FlipView:(UIView *)view options:(UIViewAnimationOptions *)option{
    
    [UIView transitionWithView:view
                      duration:1
                       options:*option
                    animations:^{
                    }
                    completion:nil];
    
}

#pragma mark - 创建KVO
-(void)createKVO {
    
    [_postCollectionView addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    [_headCollectionView addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
}



#pragma mark - KVO观察者要做的事
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSNumber *new = change[@"new"];
    NSInteger indexItem = [new integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:indexItem inSection:0];
    
/*
 _headCollectionView.index != indexPath.item  防止出现死循环
 _headCollectionView.index = indexPath.item   让视图当前显示的index 改变
*/
    if (object == _postCollectionView && _headCollectionView.index != indexPath.item) {
        [_headCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        _headCollectionView.index = indexPath.item;
        
        
    }else if (object == _headCollectionView && _postCollectionView.index != indexPath.item)
    {
        [_postCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        _postCollectionView.index = indexPath.item;
    }

}

#pragma mark - 移除KVO
-(void)dealloc {
    
    [self removeObserver:_headCollectionView forKeyPath:@"index"];
    [self removeObserver:_postCollectionView forKeyPath:@"index"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
