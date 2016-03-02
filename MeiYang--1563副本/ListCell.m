//
//  ListCell.m
//  图文混排Demo
//
//  Copyright (c) 2015年 liuyanan. All rights reserved.
//

#import "ListCell.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

// 标识添加的图片视图
#define TAG 10

@interface ListCell ()

// 头像
@property (nonatomic, strong) UIImageView * headImageView;
// 用户名
@property (nonatomic, strong) UILabel * nameLabel;
// 发布的消息
@property (nonatomic, strong) UILabel * messageLabel;

@end

@implementation ListCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 这里使用self.headImageView,是为了能够调用到getter方法
        //  [self.contentView addSubview:self.headImageView];
    }
    
    return self;
}
/**
 懒加载：也成为延迟加载，其方式是重写getter方法.
 好处：
 1.不需要再创建父视图时就将其创建出来
 2.使用的时候再去创建，不使用不创建，降低了内存的占用量
 */
- (UIImageView *)headImageView {
    // 判断控件是否存在 不存在才去创建  _headImageView为了避免重复调用，所以使用下划线的
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [self.contentView addSubview:_headImageView];
    }
    return _headImageView;
}

// 用户名
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        
        CGFloat x = CGRectGetMaxX(self.headImageView.frame) + 10;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, 10, WIDTH - x - 10, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

// 消息
- (UILabel *)messageLabel {
    if (!_messageLabel) {
        // 距左边界的距离
        CGFloat x = CGRectGetMaxX(self.headImageView.frame) + 10;
        // 居上边界的距离
        CGFloat y = CGRectGetMaxY(self.nameLabel.frame) + 5;
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, WIDTH - x - 10, 20)];
        _messageLabel.font = [UIFont systemFontOfSize:12];
        _messageLabel.textColor = [UIColor darkGrayColor];
        // 允许出现多行
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}

// 重写模型的set方法
// 重写模型的set方法
- (void)setListModel:(ListModel *)listModel {
    _listModel = listModel;
    
    // 为头像赋值
    self.headImageView.image = [UIImage imageNamed:listModel.headPhotoUrl];
    // 用户名
    self.nameLabel.text = listModel.name;
    
    // 消息  控件需要根据内容自适应高度
    // 距左边界的距离
    CGFloat x = CGRectGetMaxX(self.headImageView.frame) + 10;
    
    // 计算内容所占高度
    CGRect frame = [listModel.message boundingRectWithSize:CGSizeMake(WIDTH - x - 10, 99999999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
    
    // 赋值
    self.messageLabel.text = listModel.message;
    // 重置坐标
    self.messageLabel.frame = CGRectMake(x, CGRectGetMaxY(self.nameLabel.frame) + 5, frame.size.width, frame.size.height);
    
    // 没有图片时 cell的高度
    self.cellHeight = CGRectGetMaxY(self.messageLabel.frame) + 5;
    
    // 移除TAG标志的控件
    for (UIImageView * view in self.contentView.subviews) {
        if (view.tag == TAG) {
            [view removeFromSuperview];
        }
    }
    
    // 判断是否有图片
    if (listModel.imagesList.count > 0) {
        
        CGFloat y = CGRectGetMaxY(self.messageLabel.frame) + 5;
        // 每个图片的宽度
        CGFloat width = (WIDTH - x - 10) / 3;
        
        for (int i = 0; i < listModel.imagesList.count; i++) {
            // 创建图片视图
            UIImageView * picView = [[UIImageView alloc] initWithFrame:CGRectMake(x + (i % 3) * width, y + (i / 3) * width, width, width)];
            // listModel.imagesList[i]取出的是字典
            picView.image = [UIImage imageNamed:listModel.imagesList[i][@"image"]];
            // 添加标识
            picView.tag = TAG;
            [self.contentView addSubview:picView];
            
            // 为cell的高度重新赋值
            self.cellHeight = CGRectGetMaxY(picView.frame) + 5;
        }
        
    }
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end



