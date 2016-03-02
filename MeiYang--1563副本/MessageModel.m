//
//  MessageModel.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

// 根据传入的字典赋值
- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        // 赋值
        self.name = dict[@"userName"];
        self.message = dict[@"subtilte"];
        self.time = dict[@"time"];
        self.photo = dict[@"userImage"];
    }
    return self;
}





@end
