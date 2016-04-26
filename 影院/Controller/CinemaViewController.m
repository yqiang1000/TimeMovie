//
//  CinemaViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CinemaViewController.h"
#import "DataJSON.h"
#import "DistrictModel.h"
#import "CinemaModel.h"
#import "CinemaCell.h"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_districtData;
    
    UITableView *_tableView;
}


@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"影院";
    //读取数据
    [self loadData];
    
    [self createTableView];
    
}

#pragma mark - 创建表视图
-(void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
 
}

#pragma mark - 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _districtData.count;
    
}

#pragma mark - 每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    DistrictModel *dis =  _districtData[section];
    
    if (dis.isShow) {
        
        return dis.cinemas.count;
    }
    else
    {
        return 0;
    }

}

#pragma mark - 单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

#pragma mark - 头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
    
    
}

#pragma mark - 创建头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    
    DistrictModel *dis = _districtData[section];
    
    [button setTitle:dis.name forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hotMovieBottomImage@2x"]];

    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置tag值
    button.tag = section;
    
    return button;
    
}

-(void)buttonAction:(UIButton *)button {

    NSInteger section = button.tag;
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    
    
    
    DistrictModel *dis = _districtData[section];
    
    dis.isShow = !dis.isShow;
    
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

#pragma mark - 创建单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinemaCell"];
    if (cell == nil ) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CinemaCell" owner:self options:nil] lastObject];

    }
  
    //拿到单元格组数
    DistrictModel *dis = _districtData[indexPath.section];
    
    //拿到每个组里的单元格数目

    
    CinemaModel *cinema = dis.cinemas[indexPath.row];
 
    cell.cinema = cinema;
    
    return cell;
    
}


#pragma mark - 读取数据
-(void)loadData {
    
    //读取地区数据
    NSDictionary *dic1 = [DataJSON loadDataJSON:@"district_list"];
    
    
    _districtData = [[NSMutableArray alloc] init];
   // NSLog(@"data = %@",dic1);
    NSArray *array1 = dic1[@"districtList"];
    
    for (NSDictionary *dic in array1) {
        
        DistrictModel *dis = [[DistrictModel alloc] initContentWithDic:dic];
        
        [_districtData addObject:dis];
        
    }
    
    
    //读取电影院信息
    NSDictionary *dic2 = [DataJSON loadDataJSON:@"cinema_list"];
    
    NSArray *array2 = dic2[@"cinemaList"];
    
    for (NSDictionary *dic in array2)
    {
        //创建电影院对象
        CinemaModel *cinema = [[CinemaModel alloc] initContentWithDic:dic];
        //NSLog(@"cinema === %@",cinema);
        
        //遍历地区的 districtID 属性
        for (DistrictModel *dis in _districtData)
        {
            //判断电影院id 和地区id是否一致
            if ([dis.districtID isEqualToString:cinema.districtId])
            {
                
                [dis.cinemas addObject:cinema];

                break;
            }
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
