//
//  HYLoginViewController.m
//  电商项目
//
//  Created by yan on 16/6/17.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYLoginViewController.h"
#import "HYLoginView.h"
#import "HYthirdVIew.h"

@interface HYLoginViewController ()

@end

@implementation HYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HYLoginView * login = [[HYLoginView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 252))];
    login.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:login];
    
    HYthirdVIew * third = [[HYthirdVIew alloc]initWithFrame:(CGRectMake(0, login.frame.size.height, self.view.frame.size.width, self.view.frame.size.height))];
    third.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:third];
    
    login.viewController = self;
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
