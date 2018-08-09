//
//  ChangeViewController.h
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentSystem.h"
#import "Student.h"
@interface ChangeViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) UILabel *titleLable;
@property (nonatomic) UILabel *stuIDLable;
@property (nonatomic) UILabel *nameLable;
@property (nonatomic) UILabel *ageLable;
@property (nonatomic) UILabel *classLable;
@property (nonatomic) UILabel *scoreLable;
@property (nonatomic) UITextField *stuIDTextField;
@property (nonatomic) UITextField *nameTextField;
@property (nonatomic) UITextField *ageTextField;
@property (nonatomic) UITextField *classTextField;
@property (nonatomic) UITextField *scoreTextField;
@property (nonatomic, retain) UIButton *addButton;
@property (nonatomic, assign) NSInteger *count;
@property (nonatomic) StudentSystem *studentSystem;
@property (nonatomic) Student *student;
@end
