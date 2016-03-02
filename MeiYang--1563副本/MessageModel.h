//
//  MessageModel.h
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

// 名字
@property (nonatomic, copy) NSString * name;
// 信息
@property (nonatomic, copy) NSString * message;
// 时间
@property (nonatomic, copy) NSString * time;
// 头像
@property (nonatomic, copy) NSString * photo;

// 根据传入的字典赋值
- (id)initWithDictionary:(NSDictionary *)dict;





@end
