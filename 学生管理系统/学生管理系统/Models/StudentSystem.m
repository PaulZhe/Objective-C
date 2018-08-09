//
//  StudentSystem.m
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/8.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "StudentSystem.h"
#import "Student.h"

static StudentSystem *studentSystem = nil;

@implementation StudentSystem
@synthesize studentArray;
//2. 实现类方法---实例构造检查静态实例是否为nil
+ (instancetype) sharedStudent {
    static dispatch_once_t token;
    //使用dispatch_once一次性代码，整个程序只会执行一次，默认是线程安全的
    dispatch_once(&token, ^{
        
        studentSystem = [[self alloc] init];
        
    });
    return studentSystem;
}
//3.重写allocWithZone方法
//说明：这里的的复写目的是防止用户无意之间采用[[RootViewController alloc] init]进行初始化
+ (instancetype) allocWithZone:(struct _NSZone *)zone {
    @synchronized(self) {
        if (studentSystem == nil) {
            //说明：这里的实例是进行内存的分配
            studentSystem = [super allocWithZone: zone];
        }
    }
    return studentSystem;
}
+ (id)copyWithZone:(struct _NSZone *)zone{
    return  studentSystem;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return studentSystem;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return studentSystem;
}

-(instancetype) init{
    
    if(self = [super init]){
        studentArray = [NSMutableArray array];
    } else{
        self = nil;
    }
    return self;
}


@end
