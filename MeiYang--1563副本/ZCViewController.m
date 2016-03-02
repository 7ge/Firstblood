//
//  ZCViewController.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZCViewController.h"
#import "WeiXinController.h"


@interface ZCViewController ()
{
    //声明属性
    UITextField * UserNameField;
    
    UITextField * UserMMFieldOne;
    
    UITextField * UserMMFieldTwo;
}
@end

@implementation ZCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUser];
}

/**注册界面窗口*/
-(void)createUser {
    
    UserNameField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 275, 65)];
    UserNameField.placeholder = @"请输入用户名";
    UserNameField.tintColor = [UIColor blackColor];
    UserNameField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:UserNameField];
    
    //密码
    UserMMFieldOne = [[UITextField alloc] initWithFrame:CGRectMake(50, 140, 275, 65)];
    UserMMFieldOne.placeholder = @"请输入密码";
    UserMMFieldOne.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:UserMMFieldOne];
    
    UserMMFieldTwo = [[UITextField alloc] initWithFrame:CGRectMake(50, 180, 275, 65)];
    UserMMFieldTwo.placeholder = @"请输入密码";
    UserMMFieldTwo.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:UserMMFieldTwo];

    
    //取消按钮
    UIButton * QXbutton = [[UIButton alloc] initWithFrame:CGRectMake(30, 300, 130, 30)];
    QXbutton.backgroundColor = [UIColor grayColor];
    [QXbutton setTitle:@"取消" forState:UIControlStateNormal];
    //增加点击事件
    QXbutton.tag = 3;
    [QXbutton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:QXbutton];
    
    //注册按钮
    UIButton * ZCbutton = [[UIButton alloc] initWithFrame:CGRectMake(215, 300, 130, 30)];
    ZCbutton.backgroundColor = [UIColor greenColor];
    [ZCbutton setTitle:@"注册" forState:UIControlStateNormal];
    //增加点击事件
    ZCbutton.tag = 4;
    [ZCbutton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ZCbutton];
    
}


/**增加button点击事件*/
-(void)clicked:(UIButton *)button {
    
    if (button.tag == 3) {
        //点击取消 返回上个页面
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        
        
        
        
    }
    if (button.tag == 4) {
        
        // UserNameField;UserMMFieldOne;UserMMFieldTwo;
        
        NSLog(@"%@",UserNameField.text);
        
        
        
        
        
        
        
        
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
