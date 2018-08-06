//
//  ViewControllerLogin.m
//  iOS考核
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerLogin.h"
#import "ViewControllerRegister.h"
#import "AppDelegate.h"
#import "ViewControllerSearch.h"
#import "ViewControllerActivity.h"
#import "ViewControllerHomepage.h"
#import "ViewControllerPersonalMessage.h"
#import "ViewControllerPassage.h"

@interface ViewControllerLogin ()

@end

@implementation ViewControllerLogin

@synthesize startImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    //设置状态栏为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
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
    userTextField1 = [[UITextField alloc] init];
    passTextField1 = [[UITextField alloc] init];
    userTextField1.frame = CGRectMake(44, 305, 326, 50);
    passTextField1.frame = CGRectMake(44, 365, 326, 50);
    userTextField1.borderStyle = UITextBorderStyleRoundedRect;
    passTextField1.borderStyle = UITextBorderStyleRoundedRect;
    userTextField1.placeholder = @"请输入用户名";
    passTextField1.placeholder = @"请输入密码";
    passTextField1.secureTextEntry = YES;
    
    UIImage *userImage = [UIImage imageNamed:@"user"];
    UIImage *passImage = [UIImage imageNamed:@"pass"];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    
    userTextField1.leftView = userImageView;
    passTextField1.leftView = passImageView;
    userTextField1.leftViewMode = UITextFieldViewModeAlways;
    passTextField1.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:userTextField1];
    [self.view addSubview:passTextField1];
    
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
    
    //Do any additional setup after loading the view.
}

-(void)loginButtonClick{
    if([userTextField1.text isEqualToString:@"04151001"]  && [passTextField1.text isEqualToString:@"1234567890"]){
    //创建首页的视图控制器
    ViewControllerHomepage *vcHomePage = [[ViewControllerHomepage alloc] init];
    ViewControllerSearch *vcSearch = [[ViewControllerSearch alloc] init];
    ViewControllerPassage *vcPassage = [[ViewControllerPassage alloc] init];
    ViewControllerActivity *vcActivity = [[ViewControllerActivity alloc] init];
    ViewControllerPersonalMessage *vcPersonalMessage = [[ViewControllerPersonalMessage alloc] init];
    
    //设置导航控制器
    UINavigationController *ncHomePage = [[UINavigationController alloc] initWithRootViewController:vcHomePage];
    UINavigationController *ncSearch = [[UINavigationController alloc] initWithRootViewController:vcSearch];
    UINavigationController *ncPassage = [[UINavigationController alloc] initWithRootViewController:vcPassage];
    UINavigationController *ncActivity = [[UINavigationController alloc] initWithRootViewController:vcActivity];
    UINavigationController *ncPersonalMessage = [[UINavigationController alloc] initWithRootViewController:vcPersonalMessage];
    
    //设置导航栏控制器背景
    ncHomePage.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    vcHomePage.title = @"SHARE";
    [ncHomePage.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    ncSearch.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    vcSearch.title = @"搜索";
    [ncSearch.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    ncPassage.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    vcPassage.title = @"文章";
    [ncPassage.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    ncActivity.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    vcActivity.title = @"活动";
    [ncActivity.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    ncPersonalMessage.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    vcPersonalMessage.title = @"个人信息";
    [ncPersonalMessage.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //创建标签控制器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSArray *arrayVC = [NSArray arrayWithObjects:ncHomePage, ncSearch, ncPassage, ncActivity, ncPersonalMessage, nil];
    tabBarController.viewControllers = arrayVC;
    tabBarController.tabBar.translucent = NO;
    
    UIImage *homePageImage1 = [UIImage imageNamed:@"button1_normal"];
    UIImage *homePageImage2 = [UIImage imageNamed:@"button1_pressed"];
    UIImage *searchImage1 = [UIImage imageNamed:@"button2_normal"];
    UIImage *searchImage2 = [UIImage imageNamed:@"button2_pressed"];
    UIImage *passageImage1 = [UIImage imageNamed:@"button3_normal"];
    UIImage *passageImage2 = [UIImage imageNamed:@"button3_pressed"];
    UIImage *activityImage1 = [UIImage imageNamed:@"button4_normal"];
    UIImage *activityImage2 = [UIImage imageNamed:@"button4_pressed"];
    UIImage *personalMessageImage1 = [UIImage imageNamed:@"button5_normal"];
    UIImage *personalMessageImage2 = [UIImage imageNamed:@"button5_pressed"];
    
    //创建分栏控制器图标，后两行代码是对图片的渲染，否则出来的图片是一片蓝
    vcHomePage.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:homePageImage1 selectedImage:homePageImage2];
    vcHomePage.tabBarItem.selectedImage = [homePageImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcHomePage.tabBarItem.image = [homePageImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vcSearch.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:searchImage1 selectedImage:searchImage2];
    vcSearch.tabBarItem.selectedImage = [searchImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcSearch.tabBarItem.image = [searchImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vcPassage.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:passageImage1 selectedImage:passageImage2];
    vcPassage.tabBarItem.selectedImage = [passageImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcPassage.tabBarItem.image = [passageImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vcActivity.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:activityImage1 selectedImage:activityImage2];
    vcActivity.tabBarItem.selectedImage = [activityImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcActivity.tabBarItem.image = [activityImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vcPersonalMessage.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:personalMessageImage1 selectedImage:personalMessageImage2];
    vcPersonalMessage.tabBarItem.image = [personalMessageImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcPersonalMessage.tabBarItem.selectedImage = [personalMessageImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self presentViewController:tabBarController animated:YES completion:nil];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录失败，密码错误" message:nil preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tintColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
        [self presentViewController:alertController animated:YES completion:nil];
        
        [self performSelector:@selector(clean:) withObject:alertController afterDelay:1.5];
    }
    
}

-(void)clean:(UIAlertController *)alert{
    [alert dismissViewControllerAnimated:YES completion:nil];
}

-(void)passButtonClick{
    ViewControllerRegister *vcRegister = [[ViewControllerRegister alloc] init];
    //回调方法将输入框中的数据 传输过来
    [vcRegister returnText:^(NSString *showText,NSString *showText1) {
        userTextField1.text = showText;
        passTextField1.text = showText1;
    }];
    [self presentViewController:vcRegister animated:YES completion:nil];
}

//点击屏幕空白处调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应
    [userTextField1 resignFirstResponder];
    [passTextField1 resignFirstResponder];
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
