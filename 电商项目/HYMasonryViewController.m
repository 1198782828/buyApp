//
//  HYMasonryViewController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYMasonryViewController.h"
#import "HYinputView.h"
#import "HYthirdVIew.h"
@interface HYMasonryViewController ()

@end

@implementation HYMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HYinputView * input = [[HYinputView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 220))];
    input.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:input];
    
    HYthirdVIew * third = [[HYthirdVIew alloc]initWithFrame:(CGRectMake(0, input.frame.size.height, self.view.frame.size.width, self.view.frame.size.height))];
    third.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:third];
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
