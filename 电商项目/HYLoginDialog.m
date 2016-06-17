//
//  HYLoginDialog.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYLoginDialog.h"
#import "HYMasonryViewController.h"

@interface HYLoginDialog ()

@property (strong , nonatomic) UIImageView * backImageView;

@end

@implementation HYLoginDialog

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backImageView];
        [self addSubview:self.registerButton];
        [self addSubview:self.registrationButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.height.equalTo(125);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backImageView.mas_top).offset(55);
        make.left.equalTo(weakSelf.backImageView.mas_left).offset(107);
        make.size.equalTo(CGSizeMake(40, 20));
    }];
    
    [self.registrationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backImageView.mas_top).offset(55);
        make.left.equalTo(weakSelf.registerButton.mas_right).offset(92);
        make.size.equalTo(CGSizeMake(40, 20));
    }];
}

#pragma mark -
#pragma mark - 懒加载

- (UIImageView *)backImageView {
    if (!_backImageView) {
        
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image = [UIImage imageNamed:@"我的背景"];
    }
    return _backImageView;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        
        _registerButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_registerButton setTitle:@"登录" forState:(UIControlStateNormal)];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_registerButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_registerButton addTarget:self action:@selector(registerMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerButton;
}

- (UIButton *)registrationButton {
    if (!_registrationButton) {
        
        _registrationButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_registrationButton setTitle:@"注册" forState:(UIControlStateNormal)];
        [_registrationButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _registrationButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_registrationButton addTarget:self action:@selector(registrationMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registrationButton;
}

#pragma mark -
#pragma mark - 注册登录按钮方法


- (void)registerMethod {
    
    HYMasonryViewController * masonryVC = [[HYMasonryViewController alloc]init];
    [self.viewContoller.navigationController pushViewController:masonryVC animated:YES];
}

- (void)registrationMethod {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
