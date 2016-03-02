//
//  SecondModel.h
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondModel : NSObject

@property (nonatomic, copy) NSString * photo;

@property (nonatomic, copy) NSString * name;


// 根据传入的字典赋值
- (id)initWithDictionary:(NSDictionary *)dict;


@end
