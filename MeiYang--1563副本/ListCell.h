//
//  ListCell.h
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

@interface ListCell : UITableViewCell
// 定义模型属性 根据模型为cell赋值
@property (nonatomic, strong) ListModel * listModel;

// 记录cell的高度
@property (nonatomic, assign) CGFloat cellHeight;
@end
