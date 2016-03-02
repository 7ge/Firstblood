//
//  ListModel.h
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject


// 头像
@property (nonatomic, copy) NSString * headPhotoUrl;
// 图片列表
@property (nonatomic, strong) NSArray * imagesList;
// 用户名
@property (nonatomic, copy) NSString * name;
// 消息
@property (nonatomic, copy) NSString * message;

// 重写初始化方法 根据传入字典赋值
- (id)initWithDictionary:(NSDictionary *)dict;
@end
