//
//  ViewControllerWei.m
//  iOS考核
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerWei.h"
#import "WeiTableViewCell.h"

@interface ViewControllerWei ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewControllerWei

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

    UILabel *cuilabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 60, 20)];
    cuilabel.text = @"张哲";
    cuilabel.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:cuilabel];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, 612)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView registerClass:[WeiTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }else{
        return 2;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 250;
    }else{
        return 300;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if(cell0 == nil){
            cell0 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell0"];
            UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, 414, 209)];
            backImageView.image = [UIImage imageNamed:@"Nash"];
            
            UIImageView *MineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(314, 160, 70, 70)];
            MineImageView.image = [UIImage imageNamed:@"头像.jpeg"];
            [cell0.contentView addSubview:MineImageView];
            
            UILabel *MineLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 160, 60, 30)];
            MineLabel.text = @"Zhang";
            MineLabel.textColor = [UIColor whiteColor];
            [backImageView addSubview:MineLabel];
            [cell0.contentView addSubview:backImageView];
        }
        return cell0;
    }else{
        WeiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.imageView1.image = [UIImage imageNamed:@"头像1"];
        cell.imageView2.image = [UIImage imageNamed:@"cat.jpg"];
        cell.label1.text = @"cui";
        cell.label2.text = @"那个人的样子好怪。\n我也看到了，他好像一条狗啊！";
        cell.label3.text = @"银川";
        return cell;
    }
}

-(void)pop{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
