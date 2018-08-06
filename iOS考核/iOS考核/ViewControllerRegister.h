//
//  ViewControllerRegister.h
//  iOS考核
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnTextBlock)(NSString *showText,NSString *showText1);//重新定义了一个名字

@interface ViewControllerRegister : UIViewController

@property(nonatomic,retain) UITextField *userTextField;
@property(nonatomic,retain) UITextField *passTextField;
@property(nonatomic,retain) UITextField *emailTextField;
@property (nonatomic,copy) ReturnTextBlock returnTextBlock;//定义的一个Block属性
-(void)returnText:(ReturnTextBlock)block;
@end
