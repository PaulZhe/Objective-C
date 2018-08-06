//
//  WeiTableViewCell.m
//  iOS考核
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "WeiTableViewCell.h"

@implementation WeiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _imageView1 = [[UIImageView alloc] init];
        _imageView2 = [[UIImageView alloc] init];

        _label1 = [[UILabel alloc] init];
        _label2 = [[UILabel alloc] init];
        _label3 = [[UILabel alloc] init];
        
        [self.contentView addSubview:_imageView1];
        [self.contentView addSubview:_imageView2];
        [self.contentView addSubview:_label1];
        [self.contentView addSubview:_label2];
        [self.contentView addSubview:_label3];

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _imageView1.frame = CGRectMake(20, 20, 50, 50);
    _label1.frame = CGRectMake(80, 20, 60, 30);
    _label1.textColor = [UIColor blueColor];
    _label2.frame = CGRectMake(80, 70, 200, 40);
    _imageView2.frame = CGRectMake(80, 120, 100, 98);
    _label3.frame = CGRectMake(80, 220, 150, 20);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
