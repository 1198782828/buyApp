//
//  HYMineViewController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYMineViewController.h"
#import "HYLoginDialog.h"

@interface HYMineViewController ()

@end

@implementation HYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HYLoginDialog * loginDialog = [[HYLoginDialog alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 125))];
    loginDialog.viewContoller = self;
    [self.view addSubview:loginDialog];

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
