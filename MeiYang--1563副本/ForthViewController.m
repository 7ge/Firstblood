//
//  ForthViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ForthViewController.h"
#import "FourTableViewCell.h"



@interface ForthViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _messageArray;
    NSMutableArray * _imageArray;
    
    UITableView * _tableView;
    
}
@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
    [self createTableView];
    
}

-(void)createData {
    
    _messageArray = [[NSMutableArray alloc] initWithObjects:@"luds",@"相册",@"收藏",@"钱包",@"卡包", nil];
    
    _imageArray = [[NSMutableArray alloc] initWithObjects:@"222",@"MoreMyAlbum@2x",@"MoreMyFavorites@2x",@"MoreMyBankCard@2x",@"MyCardPackageIcon@2x", nil];
}

/**
 创建表格视图
 */
- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // 设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark -协议方法
// 1.返回多少分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
// 2.每个分组返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 1) {
        return 1;
    }
    return 4;
}

// 3.返回小表格视图cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.设置标识
    static NSString * cellId = @"cellId";
    // 2.按此标识在复用池中查找此标志的cell
    FourTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // 3.找不到 创建此标志的cell
    if (cell == nil) {
        cell = [[FourTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 根据数据源的数据为cell赋值
    
    if (indexPath.section == 0) {
        
        cell._photo.image = [UIImage imageNamed:_imageArray[indexPath.row]];
        
        cell._message.text = [_messageArray objectAtIndex:indexPath.row];
    }
    if (indexPath.section == 1) {
        
        cell._photo.image = [UIImage imageNamed:_imageArray[indexPath.row + 4]];
        
        cell._message.text = [_messageArray objectAtIndex:indexPath.row + 4];
    }
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
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
