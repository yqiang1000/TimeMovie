//
//  MovieDateilController.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MovieDetailController.h"
#import "DataJSON.h"
#import "MovieCommentModel.h"
#import "MovieCommentCell.h"
#import "MovieDetailView.h"
#import "MovieDetailModel.h"

@interface MovieDetailController ()

{
    NSMutableArray *_commentData;
    
    MovieDetailModel *_detailModel;
    

}
@end

@implementation MovieDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    #pragma mark - 创建头视图
    MovieDetailView *detailView = [[[NSBundle mainBundle] loadNibNamed:@"MovieDetailView" owner:self options:nil] lastObject];
    detailView.detailModel = _detailModel;
    
    _tableView.tableHeaderView = detailView;
    
    detailView.navigationController = self.navigationController;
}


#pragma mark - 读取数据
-(void)loadData {
    
    
    //读取单元格数据
    NSDictionary *dic1 = [DataJSON loadDataJSON:@"movie_comment"];
    
    NSArray *array1 = dic1[@"list"];
    
    _commentData = [[NSMutableArray alloc] init];
    
    for (NSDictionary *data in array1) {
        
        MovieCommentModel *commentModel = [[MovieCommentModel alloc] initWithContentDic:data];
        
        [_commentData addObject:commentModel];
    }
    
    //读取头视图数据
    NSDictionary *dic2 = [DataJSON loadDataJSON:@"movie_detail"];
    
    _detailModel = [[MovieDetailModel alloc] initContentWithDic:dic2];

}

#pragma mark - 创建单元格
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _commentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
    
    cell.commentModel = _commentData[indexPath.row];
 
    return cell;
}

#pragma mark - 设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到评论内容
    MovieCommentModel *comment = _commentData[indexPath.row];
    if (comment.isShow)
    {
    
        NSString *string = comment.comment;
        
        CGSize sizeMax = CGSizeMake(240, 1000);
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        
        CGRect rect = [string boundingRectWithSize:sizeMax options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return rect.size.height + 40;
        
    }
    else
    {
        return 70;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //拿到评论内容
    MovieCommentModel *comment = _commentData[indexPath.row];
    comment.isShow = !comment.isShow;
    
    //刷新单元格列表
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
