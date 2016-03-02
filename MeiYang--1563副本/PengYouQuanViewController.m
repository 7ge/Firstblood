//
//  PengYouQuanViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PengYouQuanViewController.h"
#import "ListModel.h"
#import "ListCell.h"

@interface PengYouQuanViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    // 数据源
    NSMutableArray * dataArray;
    // 表格视图
    UITableView * _tableView;
}
@end

@implementation PengYouQuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    [self createView];

}
/**
 创建表格视图
 */
- (void)createView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // 设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    //透视图
    UIImageView * headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    headerImageView.image = [UIImage imageNamed:@"111.jpg"];
    _tableView.tableHeaderView = headerImageView;
    
}

/**
 获得数据
 */
- (void)createData {
    
    // 初始化数据源
    dataArray = [[NSMutableArray alloc] init];
    
    // 获得.txt文件下的json数据
    // 1.获得.txt文件的路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"json_source" ofType:@"txt"];
    // 2.将此路径转化至二进制类型
    NSData * data = [NSData dataWithContentsOfFile:path];
    // 3.根据二进制数据进行json解析
    /*
     Data: 要解析的二进制数据
     options : 解析时的附属设置 一般设置为NSJSONReadingMutableContainers 使用这种配置，使返回数据类型不是字典就是数组
     error: 解析时的错误 一般置为nil
     */
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"数据==%@",jsonObj);
    
    NSArray * listArray = jsonObj[@"list"];
    // 遍历数组为模型赋值
    for (NSDictionary * dict in listArray) {
        ListModel * listModel = [[ListModel alloc] initWithDictionary:dict];
        
        // 将模型放置在数据源中
        [dataArray addObject:listModel];
    }
}

#pragma mark -协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 标识
    static NSString * cellId = @"cellId";
    // 查找
    ListCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // 创建
    if (cell == nil) {
        cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 根据模型为cell赋值
    ListModel * listModel = [dataArray objectAtIndex:indexPath.row];
    cell.listModel = listModel;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 标识
    static NSString * cellId = @"cellId";
    // 查找
    ListCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // 创建
    if (cell == nil) {
        cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 根据模型为cell赋值
    ListModel * listModel = [dataArray objectAtIndex:indexPath.row];
    cell.listModel = listModel;
    
    return cell.cellHeight;
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
