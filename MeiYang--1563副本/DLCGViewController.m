//
//  DLCGViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DLCGViewController.h"
#import "MessageCell.h"
#import "MessageModel.h"


@interface DLCGViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * dataArray;
    UITableView * _tableView;
    
}
@end

@implementation DLCGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBar];
    [self createData];
    [self createTableView];
}

-(void)createBar {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click)];
    
    self.title = @"消息";
    
    
}


//点击事件
-(void)click {
    
    NSLog(@"你好");
}

/**创建数据源*/
-(void)createData {
    
    dataArray = [[NSMutableArray alloc] init];
    
    // 1.获得plist文件的路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"ConnectPerson" ofType:@"plist"];
    // 2.解析plist文件
    NSArray * rootArray = [NSArray arrayWithContentsOfFile:path];
    // 3.遍历数组 为模型赋值
    for (NSDictionary  * dict in rootArray) {
        
        MessageModel * listModel = [[MessageModel alloc] initWithDictionary:dict];
        
        //将模型存放于数据源中
        [dataArray addObject:listModel];
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
}

#pragma mark - 协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"cellId";
    
    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    MessageModel * model = [dataArray objectAtIndex:indexPath.row];
    cell.listModel = model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"cellId";
    
    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    MessageModel * model = [dataArray objectAtIndex:indexPath.row];
    cell.listModel = model;
    
    return cell.cellHeight;
}
//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction * deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *  action, NSIndexPath * indexPath) {
        // indexPath返回的是当你点击定义的这个按钮时，此按钮所在的行或者是分组
        
        // 1.将数据在数据源中移除
        [dataArray removeObjectAtIndex:indexPath.row];
        
        // 2.刷新表格
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    // 置顶按钮
    UITableViewRowAction * topAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        // 将所选行的数据移动到最上层
        
        // 1.把将要移动的数据取出
        NSString * string = [dataArray objectAtIndex:indexPath.row];
        // 2.将要移动的数据在原来位置删除
        [dataArray removeObjectAtIndex:indexPath.row];
        // 3.将要移动的数据插入到最顶层
        [dataArray insertObject:string atIndex:0];
        // 4.刷新表格 展示数据
        [tableView reloadData];
    }];
    
    
    return @[deleteAction,topAction];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
