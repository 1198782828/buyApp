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
#import "HYVerificationCodeViewController.h"

@interface HYLoginViewController ()

@property (strong , nonatomic) HYLoginView * login;

@end

@implementation HYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.login = [[HYLoginView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 252))];
    self.login.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.login];
    [self.login.downButton addTarget:self action:@selector(GoToNextPage) forControlEvents:(UIControlEventTouchUpInside)];
    
    HYthirdVIew * third = [[HYthirdVIew alloc]initWithFrame:(CGRectMake(0, self.login.frame.size.height, self.view.frame.size.width, self.view.frame.size.height))];
    third.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:third];
    
    self.login.viewController = self;
    
}

///点击下一页方法
- (void)GoToNextPage {
    HYVerificationCodeViewController * verification = [[HYVerificationCodeViewController alloc]init];
    //手机号
    NSDictionary * Numberdic = @{
                           @"MemberId":self.login.nameText.text
                           };
    
        [self PostRequestURl:@"appMember/createCode.do" requestSucceed:^(NSDictionary *dic) {
            
            [self.navigationController pushViewController:verification animated:YES];
            
            verification.nameStr = self.login.nameText.text;
            verification.PassStr = self.login.passText.text;
            verification.tleStr = self.login.nameText.text;
            
            if (_nameTextBlock) {
                _nameTextBlock(self.login.nameText.text);
            }
            
            if (_passTextBlock) {
                _passTextBlock(self.login.passText.text);
            }
        
        } requestError:^(NSError *error) {
        
            NSLog(@"error:%@",error.localizedDescription);
        
        } parameter:Numberdic];
    
    
    
    
//    [self GetRequestURl:@"appMember/createCode.do" parameter:Numberdic requestSucceed:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
//    } requestError:^(NSError *error) {
//        NSLog(@"error:%@",error.localizedDescription);
//    }];
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
