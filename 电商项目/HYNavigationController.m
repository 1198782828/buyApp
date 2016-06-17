//
//  HYNavigationController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYNavigationController.h"

@interface HYNavigationController ()

@end

@implementation HYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar * navBar = [UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:(UIBarMetricsDefault)];
    
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor blackColor],
                                                NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0]
                                     }];
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
