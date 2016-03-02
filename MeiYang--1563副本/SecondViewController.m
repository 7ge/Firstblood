//
//  SecondViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondModel.h"
#import "SecondTableViewCell.h"


@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    // 搜索条
    UISearchBar * _searchBar;
    // 搜索控制器
    UISearchDisplayController * searchDC;
    //数据源
    NSMutableArray * dataArray;
    //表格视图
    UITableView * _tableView;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    [self createTableView];
    
    self.navigationItem.title = @"联系人";
    
}

/**创建数据源*/
-(void)createData {
    
    // 初始化数据源
    dataArray = [[NSMutableArray alloc] init];
    
    // 1.获得plist文件的路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"UserInfor" ofType:@"plist"];
    // 2.解析plist文件
    NSArray * rootArray = [NSArray arrayWithContentsOfFile:path];
     // 3.遍历数组 为模型赋值
    for (NSArray * array in rootArray) {
        
        for (NSDictionary * dict in array) {
            
            SecondModel * listModel = [[SecondModel alloc] initWithDictionary:dict];
            
            [dataArray addObject:listModel];
        }
    }
}

/**
 创建表格视图
 */
- (void)createTableView {
    
    // 创建表格视图
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // 设置代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    // 添加到视图上
    [self.view addSubview:_tableView];
    
    // 搜索条
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    // 设置空白提示语
    _searchBar.placeholder = @"你点我啊";
    
    // 设置表格视图的头视图
    _tableView.tableHeaderView = _searchBar;
    
    // 搜索控制器
    searchDC = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
}

#pragma mrak - 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.添加标识
    static NSString * cellId = @"cellId";
    // 2.复用池中查找
    SecondTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // 3.创建
    if (cell == nil) {
        cell = [[SecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 按每行取出对应的模型
    SecondModel * model = [dataArray objectAtIndex:indexPath.row];
    
    cell.listModel = model;
    
    // 返回
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.添加标识
    static NSString * cellId = @"cellId";
    // 2.复用池中查找
    SecondTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // 3.创建
    if (cell == nil) {
        cell = [[SecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 按每行取出对应的模型
    SecondModel * model = [dataArray objectAtIndex:indexPath.row];
    
    cell.listModel = model;
    
    // 返回
    return cell.cellHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"分组";
}
// 头标的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // 自定义视图的高度是由头标返回高度决定的 默认是22
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 20, 20);
    
    button.titleLabel.text = @"新朋友";
    
//    UIImage * image = [UIImage imageNamed:@"add_friend_icon_addgroup@2x"];
//    
//    [button setImage:image forState:UIControlStateNormal];
    [array addObject:button];
    
    
    return button;
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
