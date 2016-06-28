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
#import "HYThirdLogin.h"
#import <AFNetworking.h>
#import "HYMineViewController.h"

@interface HYMasonryViewController ()

@property (strong , nonatomic) HYinputView * input;

@end

@implementation HYMasonryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.input = [[HYinputView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 220))];
    self.input.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.input];
    
    
    HYthirdVIew * third = [[HYthirdVIew alloc]initWithFrame:(CGRectMake(0, self.input.frame.size.height, self.view.frame.size.width, self.view.frame.size.height))];
    
    third.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [third.QQbutton addTarget:self action:@selector(QQlogin) forControlEvents:(UIControlEventTouchUpInside)];
    
    [third.WXbutton addTarget:self action:@selector(WXbutton) forControlEvents:(UIControlEventTouchUpInside)];
    
    [third.WBbutton addTarget:self action:@selector(WBbutton) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:third];
    
    self.input.viewController = self;
    
    //登录按钮
    [self.input.registerButton addTarget:self action:@selector(loginMethod) forControlEvents:(UIControlEventTouchUpInside)];
    
}

///登录按钮的方法
- (void)loginMethod {
    
        NSDictionary * dict = @{
                               @"LoginName":self.input.nameText.text,
                               @"Lpassword":self.input.passText.text
                               };
    WS(weakSelf);
    [self GetRequestURl:@"appMember/appLogin.do" parameter:dict requestSucceed:^(NSDictionary *dic) {
        if ([dic[@"ErrorMessage"]isEqualToString: @"登陆成功"]) {
            
            [[NSUserDefaults standardUserDefaults]setObject:dic forKey:@"ISLOGIN"];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
        else {
            NSLog(@"登录失败");
        }
        
    } requestError:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}

///qq第三方登录
- (void)QQlogin {
    [HYThirdLogin QQLoginSucceed:^(NSDictionary *dic) {
        ;
    } loginError:^{
        ;
    } controller:self];
}

///微信第三方登录
- (void)WXlogin {
    
    [HYThirdLogin WinXinloginSucceed:^(NSDictionary *dic) {
        ;
    } loginError:^{
        ;
    } controller:self];
}

///微博第三方登录
- (void)WBlogin {
    
    [HYThirdLogin SinaLoginSucceed:^(NSDictionary *dic) {
        ;
    } loginError:^{
        ;
    } controller:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
