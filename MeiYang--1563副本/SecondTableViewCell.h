//
//  SecondTableViewCell.h
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"


@interface SecondTableViewCell : UITableViewCell

// 头像
@property (nonatomic, strong) UIImageView * photo;
// 名字
@property (nonatomic, strong) UILabel * name;

// 创建与cell对应的模型
@property (nonatomic, strong) SecondModel * listModel;


// 记录cell高度的变量
@property (nonatomic, assign) CGFloat cellHeight;

@end
