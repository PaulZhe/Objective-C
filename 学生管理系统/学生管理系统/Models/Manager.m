//
//  Manager.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/9.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "Manager.h"

@implementation Manager
-(instancetype)initWithKeyString:(NSString *)keyString accountString:(NSString *)accountString{
    self.keyString = keyString;
    self.accountString = accountString;
    return self;
}
@end
