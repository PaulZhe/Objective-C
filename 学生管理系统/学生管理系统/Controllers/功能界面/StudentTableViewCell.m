//
//  StudentTableViewCell.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/8.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "StudentTableViewCell.h"

@implementation StudentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.stuIDTipLable = [[UILabel alloc] init];
        self.stuIDTipLable.text = @"学号:";
        self.stuIDTipLable.textColor = [UIColor blackColor];
        self.nameTipLable = [[UILabel alloc] init];
        self.nameTipLable.text = @"姓名:";
        self.nameTipLable.textColor = [UIColor blackColor];
        self.ageTipLable = [[UILabel alloc] init];
        self.ageTipLable.text = @"年龄:";
        self.ageTipLable.textColor = [UIColor blackColor];
        self.classTipLable = [[UILabel alloc] init];
        self.classTipLable.text = @"班级:";
        self.classTipLable.textColor = [UIColor blackColor];
        self.scoreTipLable = [[UILabel alloc] init];
        self.scoreTipLable.text = @"总成绩:";
        self.scoreTipLable.textColor = [UIColor blackColor];
        
        self.stuIDLable = [[UILabel alloc] init];
        self.stuIDLable.textColor = [UIColor blackColor];
        self.nameLable = [[UILabel alloc] init];
        self.nameLable.textColor = [UIColor blackColor];
        self.ageLable = [[UILabel alloc] init];
        self.ageLable.textColor = [UIColor blackColor];
        self.classLable = [[UILabel alloc] init];
        self.classLable.textColor = [UIColor blackColor];
        self.scoreLable = [[UILabel alloc] init];
        self.scoreLable.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:_ageLable];
        [self.contentView addSubview:_stuIDLable];
        [self.contentView addSubview:_nameLable];
        [self.contentView addSubview:_classLable];
        [self.contentView addSubview:_scoreLable];
        [self.contentView addSubview:_ageTipLable];
        [self.contentView addSubview:_stuIDTipLable];
        [self.contentView addSubview:_nameTipLable];
        [self.contentView addSubview:_classTipLable];
        [self.contentView addSubview:_scoreTipLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _stuIDTipLable.frame = CGRectMake(10, 3, 40, 24);
    _stuIDLable.frame = CGRectMake(55, 3, 20, 24);
    _nameTipLable.frame = CGRectMake(70, 3, 40, 24);
    _nameLable.frame = CGRectMake(115, 3, 55, 24);
    _ageTipLable.frame = CGRectMake(175, 3, 40, 24);
    _ageLable.frame = CGRectMake(220, 3, 25, 24);
    _classTipLable.frame = CGRectMake(250, 3, 40, 24);
    _classLable.frame = CGRectMake(292, 3, 15, 24);
    _scoreTipLable.frame = CGRectMake(310, 3, 60, 24);
    _scoreLable.frame = CGRectMake(370, 3, 44, 24);
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
