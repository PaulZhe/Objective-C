//
//  Student.h
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/8.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <Foundation/Foundation.h>

static int iCount = 2;
@interface Student : NSObject
{
@public
    int stuID;
    NSString *name;
    int age;
    int classNum;
    int score;
}
@property(nonatomic) int stuID;
@property(nonatomic) NSString *name;
@property(nonatomic) int age;
@property(nonatomic) int classNum;
@property(nonatomic) int score;
- (instancetype)init;
- (instancetype)initWithStuID:(int)stuID name:(NSString *)name age:(int)age class:(int)classNum score:(int)score;
@end
