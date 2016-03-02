//
//  WeiXinController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "WeiXinController.h"
#import "ZCViewController.h"
#import "DLCGViewController.h"
#import "MyTabbarViewController.h"

@interface WeiXinController ()

@end

@implementation WeiXinController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWeixingDL];
}


/**设置微信登陆注册界面*/
-(void)createWeixingDL {
    
    //创建微信头像
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"logo"]];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(125, 64, 130, 110)];
    
    imageView.image = image;
    
    
    //添加输入用户名 输入密码
    //用户名
    UITextField * UserNameField = [[UITextField alloc] initWithFrame:CGRectMake(50, 180, 275, 65)];
    UserNameField.placeholder = @"请输入用户名";
    UserNameField.tintColor = [UIColor blackColor];
    UserNameField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:UserNameField];
    //密码
    UITextField * UserMMField = [[UITextField alloc] initWithFrame:CGRectMake(50, 240, 275, 65)];
    UserMMField.placeholder = @"请输入密码";
    UserMMField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:UserMMField];
    
    
    //添加登陆注册按钮
    //登陆按钮
    UIButton * DLbutton = [[UIButton alloc] initWithFrame:CGRectMake(50, 310, 275, 35)];
    DLbutton.backgroundColor = [UIColor greenColor];
    [DLbutton setTitle:@"登陆" forState:UIControlStateNormal];
    //增加点击事件
    DLbutton.tag = 1;
    [DLbutton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DLbutton];
    
    //注册按钮
    UIButton * ZCbutton = [[UIButton alloc] initWithFrame:CGRectMake(50, 350, 275, 35)];
    ZCbutton.backgroundColor = [UIColor grayColor];
    [ZCbutton setTitle:@"注册" forState:UIControlStateNormal];
    //增加点击事件
    ZCbutton.tag = 2;
    [ZCbutton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ZCbutton];
    
    
    //添加到视图
    [self.view addSubview:imageView];
}

//button 点击事件
-(void)clicked:(UIButton *)button {
    
    if (button.tag == 1) {
        
        MyTabbarViewController * mytabbar = [[MyTabbarViewController alloc] init];
        
        [self presentViewController:mytabbar animated:YES completion:^{
            
        }];
        
        
        
    }
    if (button.tag == 2) {
        
        ZCViewController * zcvc = [[ZCViewController alloc] init];
        
        [self presentViewController:zcvc animated:YES completion:^{
            
        }];
        
        
        
        NSLog(@"你好坏");
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //点击收回键盘
    [self.view endEditing:YES];
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
