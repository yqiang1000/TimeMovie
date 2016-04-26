//
//  MoreViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MoreViewController.h"
#import "FirstViewController.h"

@interface MoreViewController ()
{
    UIAlertView *_alert;
}
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"更多";

}
#pragma mark - 刷新缓存文件大小
-(void)viewDidAppear:(BOOL)animated
{
    _fileSizeLabel.text = [NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];
}

#pragma mark - 选中单元格调用删除数据方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *message = [[NSString alloc] init];
    NSString *title = [[NSString alloc] init];
    switch (indexPath.row) {
        case 0:
            title = @"警告";
            message = @"确定清除缓存吗";
            break;
            
        case 1:
            title = @"提示";
            message = @"给五星好评";
            break;
            
        case 2:
            title = @"提示";
            message = @"检查版本更新";
            break;
            
        case 3:
            title = @"提示";
            message = @"商务合作";
            break;
            
        case 4:
            title = @"提示";
            message = @"欢迎页面";
            break;
            
        default:
            title = @"提示";
            message = @"关于我们";
            break;
    }
    
    _alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    
    [_alert show];

    
}

#pragma mark - 调用方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@">>>>> %li",_alert.tag);
    NSString *message = alertView.message;
    if ([message isEqualToString:@"确定清除缓存吗"]) {
        NSLog(@"确定清除缓存吗");
    } else if ([message isEqualToString:@"给五星好评"]) {
        NSLog(@"给五星好评");
    } else if ([message isEqualToString:@"检查版本更新"]) {
        NSLog(@"检查版本更新");
    } else if ([message isEqualToString:@"商务合作"]) {
        NSLog(@"商务合作");
    } else if ([message isEqualToString:@"欢迎页面"]) {
//        FirstViewController *first = [[FirstViewController alloc] init];
//        [UIApplication sharedApplication].delegate.window.rootViewController = first;
        
    }
    
    if (buttonIndex == 1) {
        [self cleanCaches];
    }
}


#pragma mark - 获取文件路径
-(CGFloat)countCacheFileSize {
    
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@",homePath);
    
    /*
     1. /tmp/MediaCache/
     2. /Library/Caches/com.hackemist.SDWebImageCache.default/
     2. /Library/Caches/oc.TimeMovie/
     */
    
    //计算这些文件的大小
//    NSArray *pathArray = @[@"/tmp/MediaCache/",
//                           @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
//                           @"/Library/Caches/oc.TimeMovie/"];
    NSArray *pathArray = @[
                           ];
    //计算文件大小之和
    CGFloat fileSize = 0;
    for (NSString *string in pathArray) {
        
        //拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@",homePath,string];
        
        fileSize += [self getFileSize:filePath];
 
    }

    return fileSize;
}



#pragma mark - 获取文件此路径下文件的大小
-(CGFloat)getFileSize:(NSString *)filePath
{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
    long long size = 0;
    
    for (NSString *fileName in fileNames) {
        //拼接路径
        NSString *subFilePath = [NSString stringWithFormat:@"%@%@",filePath ,fileName];
        
        //获取文件信息
        NSDictionary *dic = [manager attributesOfItemAtPath:subFilePath error:nil];
        
        //获取单个文件大小
        NSNumber *oneSize = dic[NSFileSize];
 
        //用long long 类型来接收文件大小
        long long fileSize = [oneSize longLongValue];
        
        //计算所有文件大小
        size += fileSize;

    }
    return size / 1024.0 / 1024;
    
}


#pragma mark - 清除缓存
-(void)cleanCaches {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setValue:@"NO" forKey:@"first"];
    //删除文件路径
    NSString *homePath = NSHomeDirectory();
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                           @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/oc.TimeMovie/"];
    //计算文件大小之和
    for (NSString *string in pathArray)
    {
        
        //拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@",homePath,string];
        //文件管理
        NSFileManager *manager = [NSFileManager defaultManager];
        //获取子文件名
        NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
        
        //历遍文件夹，删除文件
        for (NSString *fileName in fileNames)
        {
            //拼接路径
            NSString *subFilePath = [NSString stringWithFormat:@"%@%@",filePath ,fileName];
            
            [manager removeItemAtPath:subFilePath error:nil];
            
        }
        
        
    }
    _fileSizeLabel.text = [NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
