//
//  SecondModel.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel

// 根据传入的字典赋值
- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        // 赋值
        self.photo = dict[@"userImage"];
        self.name = dict[@"userName"];
        
    }
    return self;
}




@end
