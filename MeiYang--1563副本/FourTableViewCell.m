//
//  FourTableViewCell.m
//  MeiYang--1563
//
//  Created by qianfeng on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FourTableViewCell.h"

@implementation FourTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createView];
    }
    return self;
}

-(void)createView
{
    
    
    self._photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];

    [self.contentView addSubview:self._photo];
    self._message = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, self.bounds.size.width - 30, 30)];

    self._message.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self._message];
    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
