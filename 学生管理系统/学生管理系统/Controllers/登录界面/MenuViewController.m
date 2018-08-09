//
//  MenuViewController.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "MenuViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"
#import "StudentSystem.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 414, 672)];
    backImageView.image = [UIImage imageNamed:@"back.jpg"];
    [self.view addSubview:backImageView];
    
    //设置按钮
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.tag = 1;
    deleteButton.tag = 2;
    changeButton.tag = 3;
    searchButton.tag = 4;
    [addButton setTitle:@"1.添加学生信息" forState:UIControlStateNormal];
    [deleteButton setTitle:@"2.删除学生信息" forState:UIControlStateNormal];
    [changeButton setTitle:@"3.修改学生信息" forState:UIControlStateNormal];
    [searchButton setTitle:@"4.查询学生信息" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:30];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:30];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:30];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [addButton setTintColor:[UIColor blackColor]];
    [deleteButton setTintColor:[UIColor blackColor]];
    [changeButton setTintColor:[UIColor blackColor]];
    [searchButton setTintColor:[UIColor blackColor]];
    addButton.frame = CGRectMake(40, 150, 334, 70);
    deleteButton.frame = CGRectMake(40, 300, 334, 70);
    changeButton.frame = CGRectMake(40, 450, 334, 70);
    searchButton.frame = CGRectMake(40, 600, 334, 70);
    [addButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [deleteButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [changeButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [searchButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    [self.view addSubview:deleteButton];
    [self.view addSubview:changeButton];
    [self.view addSubview:searchButton];
    
    //数据
    StudentSystem *studentSystem = [StudentSystem sharedStudent];
    Student *stu1, *stu2, *stu3;
    stu1 = [[Student alloc] initWithStuID:1 name:@"张三" age:19 class:1 score:272];
    stu2 = [[Student alloc] initWithStuID:2 name:@"李四" age:18 class:3 score:260];
    stu3 = [[Student alloc] initWithStuID:3 name:@"王五" age:19 class:2 score:239];
    [studentSystem.studentArray addObject:stu1];
    [studentSystem.studentArray addObject:stu2];
    [studentSystem.studentArray addObject:stu3];
}

- (void)press:(UIButton *)button{
    if(button.tag == 1){
        AddViewController *addViewController = [[AddViewController alloc] init];
        [self.navigationController pushViewController:addViewController animated:YES];
    } else if(button.tag == 2){
        DeleteViewController *deleteViewController = [[DeleteViewController alloc] init];
        [self.navigationController pushViewController:deleteViewController animated:YES];
    } else if(button.tag == 3){
        ChangeViewController *changeViewController = [[ChangeViewController alloc] init];
        [self.navigationController pushViewController:changeViewController animated:YES];
    } else{
        SearchViewController *searchViewController = [[SearchViewController alloc] init];
        [self.navigationController pushViewController:searchViewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
