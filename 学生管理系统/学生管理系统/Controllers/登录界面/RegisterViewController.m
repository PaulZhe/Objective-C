//
//  RegisterViewController.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "RegisterViewController.h"
#import "Manager.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize passTextField;
@synthesize userTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.89f blue:0.62f alpha:1.00f];
    
    //设置背景logo
    UIImage *logoImage = [UIImage imageNamed:@"西邮图标"];
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    logoImageView.frame = CGRectMake(150, 100, 114, 114);
    [self.view addSubview:logoImageView];
    
    UILabel *labelLogo = [[UILabel alloc] init];
    labelLogo.text = @"学生管理系统";
    labelLogo.textColor = [UIColor colorWithRed:0.00f green:0.47f blue:0.85f alpha:1.00f];
    labelLogo.frame = CGRectMake(137, 220, 140, 40);
    labelLogo.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:labelLogo];
    
    //设置textField
    userTextField = [[UITextField alloc] init];
    passTextField = [[UITextField alloc] init];
    userTextField.frame = CGRectMake(44, 305, 326, 50);
    passTextField.frame = CGRectMake(44, 365, 326, 50);
    userTextField.borderStyle = UITextBorderStyleRoundedRect;
    passTextField.borderStyle = UITextBorderStyleRoundedRect;
    userTextField.placeholder = @"请输入注册帐号(8位)";
    passTextField.placeholder = @"请输入密码(不少于6位)";
    passTextField.secureTextEntry = YES;
    
    UIImage *userImage = [UIImage imageNamed:@"user"];
    UIImage *passImage = [UIImage imageNamed:@"pass"];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    
    userTextField.leftView = userImageView;
    passTextField.leftView = passImageView;
    userTextField.leftViewMode = UITextFieldViewModeAlways;
    passTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:userTextField];
    [self.view addSubview:passTextField];
    
    //设置button
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@"确认注册" forState:UIControlStateNormal];
    registerButton.frame = CGRectMake(120, 455, 170, 45);
    [registerButton setTintColor:[UIColor whiteColor]];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置按钮边框
    [registerButton.layer setMasksToBounds:YES];
    [registerButton.layer setCornerRadius:10.0];
    [registerButton.layer setBorderWidth:1.5];
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [self.view addSubview:registerButton];}

-(void)registerButtonClick
{
    int flag = 1;
    for(Manager *manager in _managerArray){
        if([manager.accountString isEqualToString:userTextField.text] || [userTextField.text length] != 8 || [passTextField.text length] < 6){
            flag = 0;
            break;
        }
    }
    if(flag == 1){
        _tempManager = [[Manager alloc] init];
        _tempManager.keyString = passTextField.text;
        _tempManager.accountString = userTextField.text;
        [self dismissViewControllerAnimated:YES completion:nil];
        [_delegate pass:_tempManager];
    } else{
        [self performSelector:@selector(alert)];
    }
}

//点击屏幕空白处调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [userTextField resignFirstResponder];
    [passTextField resignFirstResponder];
}

- (void)alert{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"注册帐号已存在或者输入帐号密码不符合格式" preferredStyle:UIAlertControllerStyleAlert];
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
