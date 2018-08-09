//
//  Student.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/8.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize stuID, name, age, classNum, score;
- (instancetype)init
{
    if(self = [super init]){
        stuID = 0;
        name = nil;
        age = 0;
        classNum = 0;
        score = 0;
    } else{
        self = nil;
    }
    return self;
}

- (instancetype)initWithStuID:(int)stuID name:(NSString *)name age:(int)age class:(int)classNum score:(int)score{
    self.stuID = stuID;
    self.name = name;
    self.age = age;
    self.classNum = classNum;
    self.score = score;
    return self;
}

@end
