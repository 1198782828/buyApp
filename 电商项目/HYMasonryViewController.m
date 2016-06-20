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
    
    input.viewController = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
