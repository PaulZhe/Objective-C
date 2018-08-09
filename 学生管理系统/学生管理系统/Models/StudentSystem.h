//
//  StudentSystem.h
//  学生管理系统
//
//  Created by 小哲的DELL on 2018/8/8.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentSystem : NSObject{
@public NSMutableArray *studentArray;
}
@property(nonatomic) NSMutableArray *studentArray;
- (instancetype)init;
+ (instancetype) allocWithZone:(struct _NSZone *)zone;
+ (instancetype) sharedStudent;
@end
