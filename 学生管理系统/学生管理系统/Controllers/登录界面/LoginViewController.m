//
//  LoginViewController.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MenuViewController.h"

@interface LoginViewController ()<RegisterViewControllerDelegate>

@end

@implementation LoginViewController
@synthesize passTextField;
@synthesize userTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    _managerArray = [[NSMutableArray alloc] init];
    
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
    userTextField.placeholder = @"请输入用户名";
    passTextField.placeholder = @"请输入密码";
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
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *passButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [passButton setTitle:@"注册" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(84, 455, 109, 45);
    passButton.frame = CGRectMake(221, 455, 109, 45);
    [loginButton setTintColor:[UIColor whiteColor]];
    [passButton setTintColor:[UIColor whiteColor]];
    [passButton addTarget:self action:@selector(passButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置按钮边框
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10.0];
    [loginButton.layer setBorderWidth:1.5];
    [passButton.layer setMasksToBounds:YES];
    [passButton.layer setCornerRadius:10.0];
    [passButton.layer setBorderWidth:1.5];
    loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    passButton.layer.borderColor = [UIColor whiteColor].CGColor;
    loginButton.titleLabel.font = [UIFont systemFontOfSize:27];
    passButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [self.view addSubview:loginButton];
    [self.view addSubview:passButton];
    
    //给数组添值
    Manager *manager1 = [[Manager alloc] initWithKeyString:@"123456" accountString:@"04171100"];
    Manager *manager2 = [[Manager alloc] initWithKeyString:@"123456" accountString:@"04171101"];
    [_managerArray addObject:manager1];
    [_managerArray addObject:manager2];
}

-(void)passButtonClick{
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [self presentViewController:registerViewController animated:YES completion:nil];
    registerViewController.managerArray = self.managerArray;
    registerViewController.delegate = self;
}

-(void)loginButtonClick{
    int flag = 0;
    for(Manager *manager in _managerArray){
        if([manager.accountString isEqualToString:userTextField.text] && [manager.keyString isEqualToString:passTextField.text]){
            flag = 1;
            break;
        } else{
            flag = 0;
        }
    }
    if(flag == 1){
        //创建主界面视图控制器
        MenuViewController *menuViewController = [[MenuViewController alloc] init];
    
        //创建主界面导航控制器
        UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    
        //设置导航栏控制器背景
        menuNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.92f green:0.89f blue:0.62f alpha:1.00f];
        menuViewController.title = @"学生管理系统";
        [menuNavigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor colorWithRed:0.00f green:0.47f blue:0.85f alpha:1.00f]}];
    
        [self presentViewController:menuNavigationController animated:YES completion:nil];
    } else{
        [self performSelector:@selector(alert)];
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [userTextField resignFirstResponder];
    [passTextField resignFirstResponder];
}

//实现代理方法
-(void)pass:(Manager *)manager{
    [_managerArray addObject:manager];
}

- (void)alert{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"账号或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
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
