//
//  ViewControllerRegister.m
//  iOS考核
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerRegister.h"
#import "ViewControllerLogin.h"

@interface ViewControllerRegister ()

@end

@implementation ViewControllerRegister

@synthesize userTextField;
@synthesize passTextField;
@synthesize emailTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    
    //设置背景logo
    UIImage *logoImage = [UIImage imageNamed:@"login_logo"];
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    logoImageView.frame = CGRectMake(150, 100, 114, 114);
    [self.view addSubview:logoImageView];
    
    UILabel *labelLogo = [[UILabel alloc] init];
    labelLogo.text = @"SHARE";
    labelLogo.textColor = [UIColor whiteColor];
    labelLogo.frame = CGRectMake(150, 220, 114, 40);
    labelLogo.font = [UIFont systemFontOfSize:36];
    [self.view addSubview:labelLogo];
    
    //设置textField
    userTextField = [[UITextField alloc] init];
    passTextField = [[UITextField alloc] init];
    emailTextField = [[UITextField alloc] init];
    userTextField.frame = CGRectMake(44, 360, 326, 50);
    passTextField.frame = CGRectMake(44, 420, 326, 50);
    emailTextField.frame = CGRectMake(44, 300, 326, 50);
    userTextField.borderStyle = UITextBorderStyleRoundedRect;
    passTextField.borderStyle = UITextBorderStyleRoundedRect;
    emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    userTextField.placeholder = @"请输入用户名";
    passTextField.placeholder = @"请输入密码";
    emailTextField.placeholder = @"请输入电子邮箱";
    
    UIImage *userImage = [UIImage imageNamed:@"user"];
    UIImage *passImage = [UIImage imageNamed:@"pass"];
    UIImage *emailImage = [UIImage imageNamed:@"email"];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    UIImageView *emailImageView = [[UIImageView alloc] initWithImage:emailImage];
    
    userTextField.leftView = userImageView;
    passTextField.leftView = passImageView;
    emailTextField.leftView = emailImageView;
    userTextField.leftViewMode = UITextFieldViewModeAlways;
    passTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:userTextField];
    [self.view addSubview:passTextField];
    [self.view addSubview:emailTextField];
    
    //设置button
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@"确认注册" forState:UIControlStateNormal];
    registerButton.frame = CGRectMake(120, 510, 170, 45);
    [registerButton setTintColor:[UIColor whiteColor]];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置按钮边框
    [registerButton.layer setMasksToBounds:YES];
    [registerButton.layer setCornerRadius:10.0];
    [registerButton.layer setBorderWidth:1.5];
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [self.view addSubview:registerButton];
    
    // Do any additional setup after loading the view.
}

//把传进来的Block语句块保存到本类的实例变量returnTextBlock（.h中定义的属性）中，然后寻找一个时机调用
-(void)returnText:(ReturnTextBlock)block{
    self.returnTextBlock = block;
}
//而这个时机就是当视图将要消失的时候，需要重写：
-(void)viewWillDisappear:(BOOL)animated{
    if (self.returnTextBlock !=nil) {
        self.returnTextBlock(self.userTextField.text,self.passTextField.text);
        
    }
}

-(void)registerButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//点击屏幕空白处调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应
    [self.userTextField resignFirstResponder];
    [self.passTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
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

