//
//  ChangeViewController.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ChangeViewController.h"
#import "StudentTableViewCell.h"

@interface ChangeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation ChangeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.66f alpha:1.00f];
    self.studentSystem = [StudentSystem sharedStudent];
    self.count = _studentSystem.studentArray.count;
    //设置Label
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(142, 515, 150, 35)];
    self.titleLable.text = @"修改学生信息";
    self.titleLable.font = [UIFont systemFontOfSize:20];
    self.titleLable.textColor = [UIColor blackColor];
    self.stuIDLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 551, 60, 20)];
    self.stuIDLable.text = @"学号:";
    self.stuIDLable.textColor = [UIColor blackColor];
    self.nameLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 581, 60, 20)];
    self.nameLable.text = @"姓名:";
    self.nameLable.textColor = [UIColor blackColor];
    self.ageLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 611, 60, 20)];
    self.ageLable.text = @"年龄:";
    self.ageLable.textColor = [UIColor blackColor];
    self.classLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 641, 60, 20)];
    self.classLable.text = @"班级:";
    self.classLable.textColor = [UIColor blackColor];
    self.scoreLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 671, 60, 20)];
    self.scoreLable.text = @"总成绩:";
    self.scoreLable.textColor = [UIColor blackColor];
    [self.view addSubview:_ageLable];
    [self.view addSubview:_titleLable];
    [self.view addSubview:_stuIDLable];
    [self.view addSubview:_nameLable];
    [self.view addSubview:_classLable];
    [self.view addSubview:_scoreLable];
    
    //设置button
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addButton setTitle:@"确定修改" forState:normal];
    [_addButton setTintColor:[UIColor blackColor]];
    _addButton.frame = CGRectMake(147, 698, 120, 30);
    [_addButton.layer setMasksToBounds:YES];
    [_addButton.layer setCornerRadius:10.0];
    [_addButton.layer setBorderWidth:1.5];
    _addButton.layer.borderColor = [UIColor blackColor].CGColor;
    _addButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_addButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addButton];
    
    //设置文本输入框
    _stuIDTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 551, 314, 20)];
    _stuIDTextField.placeholder = @"请输入学生学号";
    _stuIDTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 581, 314, 20)];
    _nameTextField.placeholder = @"请输入学生姓名";
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 611, 314, 20)];
    _ageTextField.placeholder = @"请输入学生年龄";
    _ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 641, 314, 20)];
    _classTextField.placeholder = @"请输入学生班级";
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 671, 314, 20)];
    _scoreTextField.placeholder = @"请输入学生总成绩";
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.ageTextField.delegate = self;
    self.nameTextField.delegate = self;
    self.stuIDTextField.delegate = self;
    self.classTextField.delegate = self;
    self.scoreTextField.delegate = self;
    [self.view addSubview:_stuIDTextField];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_ageTextField];
    [self.view addSubview:_classTextField];
    [self.view addSubview:_scoreTextField];
    
    //注册观察键盘的变化
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    //设置UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, 445) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [_tableView registerClass:[StudentTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.count = _studentSystem.studentArray.count;
    return _count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    StudentSystem *studentSystem = [StudentSystem sharedStudent];
    _student = [[Student alloc] init];
    _student = studentSystem->studentArray[indexPath.row];
    cell.stuIDLable.text = [NSString stringWithFormat:@"%d",_student.stuID];
    cell.nameLable.text = _student.name;
    cell.ageLable.text = [NSString stringWithFormat:@"%d",_student.age];
    cell.classLable.text = [NSString stringWithFormat:@"%d",_student.classNum];
    cell.scoreLable.text = [NSString stringWithFormat:@"%d",_student.score];
    return cell;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UITextField *textField in self.view.subviews){
        [textField resignFirstResponder];
    }
}
//移动UIView
-(void)transformView:(NSNotification *)aNSNotification
{
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    
    //在0.25s内完成self.view的Frame的变化，等于是给self.view添加一个向上移动deltaY的动画
    [UIView animateWithDuration:0.25f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    [self.view endEditing:YES];
    return YES;
}

- (void)press{
    int flag = 1;
    StudentSystem *studentSystem = [StudentSystem sharedStudent];
    if([_ageTextField.text isEqualToString:@""] || [_nameTextField.text isEqualToString:@""] || [_stuIDTextField.text isEqualToString:@""] || [_classTextField.text isEqualToString:@""]|| [_scoreTextField.text isEqualToString:@""]){
        flag = 0;
    }
    for(Student *stu in studentSystem.studentArray){
        if(stu.stuID == [self.stuIDTextField.text intValue]){
            flag = 1;
            break;
        } else{
            flag = 0;
        }
    }
    if(flag == 1){
        for(Student *stu in studentSystem.studentArray){
            if(stu.stuID == [self.stuIDTextField.text intValue]){
                stu.stuID = [self.stuIDTextField.text intValue];
                stu.name = self.nameTextField.text;
                stu.age = [self.ageTextField.text intValue];
                stu.classNum = [self.classTextField.text intValue];
                stu.score = [self.scoreTextField.text intValue];
            }
        }
        [self.tableView reloadData];
    } else{
        [self performSelector:@selector(alert)];
    }
}

- (void)alert{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改失败" message:@"修改学生不存在或者学生信息未录入" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
