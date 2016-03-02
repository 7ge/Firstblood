//
//  MyTabbarViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyTabbarViewController.h"

#import "DLCGViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"


@interface MyTabbarViewController ()

@end

@implementation MyTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabbar];
}

/**设置tabbar*/
-(void)createTabbar {
    
    //1.定义存放模块的数组
    NSMutableArray * viewController = [[NSMutableArray alloc] init];
    
    NSArray * classNameArray = [[NSArray alloc] initWithObjects:@"DLCGViewController",@"SecondViewController",@"ThirdViewController",@"ForthViewController", nil];
    
    NSArray * titleArray = [[NSArray alloc] initWithObjects:@"消息",@"通讯录",@"发现",@"我", nil];
    
    NSArray * imageArray = [NSArray arrayWithObjects:@"tabbar_mainframe@2x",@"tabbar_contacts@2x",@"tabbar_discover@2x",@"tabbar_me@2x", nil];
    
    NSArray * seclectedImageArray = [[NSArray alloc] initWithObjects:@"tabbar_mainframeHL@2x",@"tabbar_contactsHL@2x",@"tabbar_discoverHL@2x",@"tabbar_meHL@2x", nil];
    //根据类名创建对应的对象
    int i = 0;
    
    for (NSString * className in classNameArray) {
        Class class = NSClassFromString(className);
        ViewController * vc = [[class alloc] init];
        // 分栏控制器中每个模块都是导航栏视图控制器
        UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:vc];
        // 设置标题
        nvc.tabBarItem.title = titleArray[i];
        // 设置图片
        nvc.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 设置选中图片
        nvc.tabBarItem.selectedImage = [[UIImage imageNamed:seclectedImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 存于数组中
        [viewController addObject:nvc];
        
        i++;
    }
    self.viewControllers = viewController;
    
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
