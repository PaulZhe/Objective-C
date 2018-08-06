//
//  ViewControllerHomepage.m
//  iOS考核
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerHomepage.h"
#import "ViewControllerWei.h"

@interface ViewControllerHomepage ()

@end

@implementation ViewControllerHomepage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *itemright = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"前进"] style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    self.navigationItem.rightBarButtonItem = itemright;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

-(void)push{
    ViewControllerWei *vcWei = [[ViewControllerWei alloc] init];
    [self.navigationController pushViewController:vcWei animated:YES];
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
