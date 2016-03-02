//
//  ListModel.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel
// 重写初始化方法 根据传入字典赋值
- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        // 赋值
        self.headPhotoUrl = dict[@"headPhotoUrl"];
        self.imagesList = dict[@"imagesList"];
        self.name = dict[@"name"];
        self.message = dict[@"message"];
    }
    return self;
}

@end
