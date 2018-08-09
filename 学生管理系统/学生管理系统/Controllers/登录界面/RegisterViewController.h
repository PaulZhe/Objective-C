//
//  RegisterViewController.h
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/7.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manager.h"
//设置代理
@class RegisterViewController;
@protocol RegisterViewControllerDelegate<NSObject>;
-(void)pass:(Manager*)manager;
@end

@interface RegisterViewController : UIViewController

@property(nonatomic,strong)UITextField *userTextField;
@property(nonatomic,strong)UITextField *passTextField;
@property(nonatomic,weak)id <RegisterViewControllerDelegate> delegate;
@property(nonatomic) Manager *tempManager;
@property(nonatomic) NSMutableArray *managerArray;
@end
