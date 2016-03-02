//
//  MessageCell.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

// 重写初始化方法 -- 相当于外调的接口
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 创建视图
        [self createView];
    }
    return self;
}

/**创建视图*/
-(void)createView {
    //头像
    self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [self.contentView addSubview:self.photo];
    //名字
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, self.bounds.size.width - 100, 20)];
    [self.contentView addSubview:self.name];
    //时间
    self.time = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 50, 10, 60, 20)];
    self.time.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.time];
    //信息
    self.message = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, self.bounds.size.width - 90, 20)];
    self.message.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.message];
}

// 重写一下listModel的set方法
-(void)setListModel:(MessageModel *)listModel {
    
    _listModel = listModel;
    
    self.photo.image = [UIImage imageNamed:listModel.photo];
    self.name.text = listModel.name;
    self.time.text = listModel.time;
    
    CGRect frame = [listModel.message boundingRectWithSize:CGSizeMake(self.bounds.size.width - 90, 99999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
    
    self.message.text = listModel.message;
    self.message.frame = CGRectMake(60, 42, frame.size.width, frame.size.height);
    // 给记录cell高度的变量赋值
    self.cellHeight = CGRectGetMaxY(self.message.frame);
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
