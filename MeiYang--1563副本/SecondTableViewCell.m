//
//  SecondTableViewCell.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

// 重写初始化方法 -- 相当于外调的接口
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 创建视图
        [self createView];
    }
    return self;
}

//创建视图
-(void)createView {
    
    self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    [self.contentView addSubview:self.photo];

    self.name = [[UILabel alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(self.name.frame), self.bounds.size.width - 90, 20)];
    [self.contentView addSubview:self.name];
    
    
}

// 重写一下listModel的set方法
-(void)setListModel:(SecondModel *)listModel {
    
    _listModel = listModel;
    
    self.photo.image = [UIImage imageNamed:listModel.photo];
    
    CGRect frame = [listModel.name boundingRectWithSize:CGSizeMake(self.bounds.size.width - 90, 99999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    // 设置detailLabel的大小
    self.name.text = listModel.name;
    self.name.frame = CGRectMake(80, 50, frame.size.width, frame.size.height);
    
    // 给记录cell高度的变量赋值
    self.cellHeight = CGRectGetMaxY(self.name.frame);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
