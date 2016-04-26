//
//  NewsViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NewsViewController.h"
#import "DataJSON.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"
#import "NewsCell.h"
#import "ImageLIstViewController.h"
#import "WebViewController.h"

@interface NewsViewController ()
{

    UITableView *_newsTableView;
    NSMutableArray *_newsData;
    UIImageView *_topImageView;   //顶部单元格的视图
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新闻";

    //加载数据
    [self loadData];
    
    //创建表视图
//    [self creatTableView];
    
    
}

#pragma mark - 创建表视图
/*
 *在故事板中已经创建了tableView，所以不用代码创建
-(void)creatTableView {
    
    _newsTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _newsTableView.delegate = self;
    _newsTableView.dataSource = self;
    
    _newsTableView.backgroundColor = [UIColor redColor];

    [self.view addSubview:_newsTableView];

}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _newsData.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    //创建第一个单元格
    //第一个
    NewsModel *news = _newsData[indexPath.row];
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopNewsCell"];
        
        //设置单元格图片和标题
        _topImageView = (UIImageView *)[cell.contentView viewWithTag:100];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
        //获取_newsData中的数据
        
        [_topImageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        
        label.text = news.title;
        label.tintColor = [UIColor whiteColor];
 
        return cell;
        
    }else{
        
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
        
        cell.titleLabel.text = news.title;
        [cell.image sd_setImageWithURL:[NSURL URLWithString:news.image]];
        cell.summaryLabel.text = news.summary;
        [cell.typeImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",news.type]]];
        
        if ([news.type isEqualToNumber:@1]) {
            cell.typeImage.image = [UIImage imageNamed:@"sctpxw"];
        }
        return cell;
    }
}

#pragma mark - 设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }else{
        return 70;
    }
}

#pragma mark - 选中单元格跳转界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *news = _newsData[indexPath.row];
    
    if ([news.type isEqualToNumber:@1]) {
        
        NewsSecondViewController *view = [[NewsSecondViewController alloc]init];
        view.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:view animated:YES];
    }
    else if([news.type isEqualToNumber:@0])
    {
        WebViewController *webVC = [[WebViewController alloc] init];
        webVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webVC animated:YES];
       
    }
   
}


#pragma mark - 加载数据
-(void)loadData
{
    NSArray *array = [DataJSON loadDataJSON:@"news_list"];
    _newsData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        
        NewsModel *news = [[NewsModel alloc]initContentWithDic:dic];
        [_newsData addObject:news];
        
    }

}

#pragma mark - 监视滑动动作
// 滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y + 64;
    NSLog(@"********%f",y);
    if (y < 0) {
        //获取新旧高度
        CGFloat oldHeight = 150;
        CGFloat newHeight = 150 - y;
        
        //放大倍数
        CGFloat scale = newHeight / oldHeight ;
        
        CGAffineTransform transform = CGAffineTransformMakeScale(scale,scale);
        
         _topImageView.transform = transform;
        
        //修改中心点
        
        _topImageView.top = y;

    }

    NSLog(@"新闻正在滑动。。。");
    
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
