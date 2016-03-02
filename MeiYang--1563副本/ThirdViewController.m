//
//  ThirdViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ThirdViewController.h"
#import "PengYouQuanViewController.h"


@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * imageArray;
    NSMutableArray * messageArray;
    
    UITableView * _tableView;
    
}
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createDataArray];
    [self createTableView];
    self.navigationItem.title = @"发现";
}

/**
 创建表格视图
 */
- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // 设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //    _tableView.editing = YES;
    [self.view addSubview:_tableView];
}

/**
 在数据源中添加数据
 */
- (void)createDataArray {
    // 初始化数据源
    imageArray = [[NSMutableArray alloc] initWithObjects:@"ff_IconShowAlbum@2x",@"ff_IconQRCode@2x",@"ff_IconShake@2x",@"ff_IconLocationService@2x",@"ff_IconBottle@2x", nil];
    messageArray = [[NSMutableArray alloc] initWithObjects:@"朋友圈",@"扫一扫",@"摇一摇",@"附近的人",@"漂流瓶", nil];
}
#pragma mark -协议方法
// 1.返回多少分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
// 2.每个分组返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 1) {
        return 1;
    }
    return 2;
}

// 3.返回小表格视图cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.设置标识
    static NSString * cellId = @"cellId";
    // 2.按此标识在复用池中查找此标志的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // 3.找不到 创建此标志的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 根据数据源的数据为cell赋值
    
    cell.textLabel.text = [messageArray objectAtIndex:(indexPath.section + indexPath.row)] ;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PengYouQuanViewController * pyqvc = [[PengYouQuanViewController alloc] init];
    
    [self.navigationController pushViewController:pyqvc animated:YES];
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
