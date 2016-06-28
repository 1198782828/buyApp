//
//  HYMineViewController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYMineViewController.h"

@interface HYMineViewController ()

///tabbleview
@property (strong , nonatomic) HYLoginTableView * loginVC;

@end

@implementation HYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setHidesBackButton:TRUE animated:NO];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self.view addSubview:self.yetLogin];
    
    [self.view addSubview:self.loginDialog];
    
    [self.view addSubview:self.loginVC];
    
    [self.view addSubview:self.exitBtn];
    
    __weak typeof(self) weakSelf = self;
    [self.loginDialog mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.height.equalTo(125);
    }];

    [self.loginVC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginDialog.mas_bottom).offset(35);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.height.equalTo(280);
    }];
    
    [self.exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginVC.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(50);
        make.right.equalTo(weakSelf.view.mas_right).offset(-50);
        make.height.equalTo(45);
    }];
    
    [self.yetLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.height.equalTo(125);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_loginVC reloadData];
    NSDictionary * login = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
    if (login.count != 0) {
        self.exitBtn.hidden = NO;
        self.yetLogin.hidden = NO;
        self.loginDialog.hidden = YES;
    }
}

- (HYLoginDialog *)loginDialog {
    if (!_loginDialog) {
        _loginDialog = [[HYLoginDialog alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 125))];
        _loginDialog.viewContoller = self;
    }
    return _loginDialog;
}

- (HYLoginTableView *)loginVC {
    if (!_loginVC) {
        
        _loginVC = [[HYLoginTableView alloc]initWithFrame:(CGRectMake(0, 160, self.view.frame.size.width, 280)) style:(UITableViewStylePlain)];
        _loginVC.bounces = NO;
    }
    return _loginVC;
}

- (UIButton *)exitBtn {
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        _exitBtn.frame = CGRectMake(50, 440, 275, 45);
        [_exitBtn setBackgroundImage:[UIImage imageNamed:@"我的界面退出登录按钮"] forState:(UIControlStateNormal)];
        [_exitBtn addTarget:self action:@selector(exitMethod) forControlEvents:(UIControlEventTouchUpInside)];
        _exitBtn.hidden = YES;
        
    }
    return _exitBtn;
}

- (HYYetLoginView *)yetLogin {
    if (!_yetLogin) {
        
        _yetLogin = [[HYYetLoginView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 125))];
    }
    return _yetLogin;
}

- (void)exitMethod {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ISLOGIN"];
    self.loginDialog.hidden = NO;
    self.yetLogin.hidden = YES;
    self.exitBtn.hidden = YES;
    [self.loginVC reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
