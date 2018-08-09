//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentSystem.h"
#import "Student.h"

@interface DeleteViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) UILabel *titleLable;
@property (nonatomic) UILabel *stuIDLable;

@property (nonatomic) UITextField *stuIDTextField;

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic) StudentSystem *studentSystem;
@property (nonatomic) Student *student;

@property (nonatomic, assign) NSInteger *count;
@end
