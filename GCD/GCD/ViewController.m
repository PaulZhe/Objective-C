//
//  ViewController.m
//  GCD
//
//  Created by 小哲的DELL on 2018/10/18.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//同步并发
- (void)syncConcurrent{
    NSLog(@"currentThread---%@",[NSThread currentThread]);
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("syncConcurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3---%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"syncConcurrent---end");
}

//异步串行
-(void)asyncSerial{
    NSLog(@"currentThread---%@", [NSThread currentThread]);
    NSLog(@"asyncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("asyncSerial", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3---%@", [NSThread currentThread]);
        }
    });
    NSLog(@"asyncSerial---end");
}

//同步串行
- (void)syncSerial{
    NSLog(@"currentThread---%@", [NSThread currentThread]);
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("syncSerial", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3---%@", [NSThread currentThread]);
        }
    });
    NSLog(@"syncSerial---end");
}

//异步并发
- (void)asyncConcurrent{
    NSLog(@"currentThread---%@", [NSThread currentThread]);
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("asyncConcurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3---%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncConcurrent---end");
}

- (void)asyncMain{
    NSLog(@"currentThread---%@", [NSThread currentThread]);
    NSLog(@"asyncMain---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3---%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncMain---end");
}

- (void)siSuo{
    dispatch_queue_t queue = dispatch_queue_create("com.bestswifter.queue", nil);
    dispatch_sync(queue, ^{
        NSLog(@"current thread = %@", [NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"current thread = %@", [NSThread currentThread]);
        });
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_queue_t queue1 = dispatch_queue_create(<#const char * _Nullable label#>, <#dispatch_queue_attr_t  _Nullable attr#>)
//    dispatch_group_async(group, <#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)

//    //同步并发
//    [self syncConcurrent];
//    //异步串行
//    [self asyncSerial];
//    //同步串行
//    [self syncSerial];
//    //异步并发
//    [self asyncConcurrent];
//    //异步主队列
    [self asyncMain];
//    [self siSuo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
