//
//  Manager.h
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/9.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

@property(nonatomic) NSString *keyString;
@property(nonatomic) NSString *accountString;

-(instancetype)initWithKeyString:(NSString *)keyString accountString:(NSString *)accountString;
@end
