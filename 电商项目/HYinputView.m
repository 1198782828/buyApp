//
//  HYinputView.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYinputView.h"

@interface HYinputView ()

@property (strong , nonatomic) UILabel * backLabel;
@property (strong , nonatomic) UITextField * nameText;
@property (strong , nonatomic) UITextField * passText;
@property (strong , nonatomic) UILabel * lineLabel;
@property (strong , nonatomic) UIButton * loginButton;
@property (strong , nonatomic) UIButton * registerButton;

@end

@implementation HYinputView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backLabel];
        [self addSubview:self.nameText];
        [self addSubview:self.lineLabel];
        [self addSubview:self.passText];
        [self addSubview:self.registerButton];
        [self addSubview:self.loginButton];
    }
    return self;
}

#pragma mark -
#pragma mark - 约束

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.height.equalTo(88);
    }];
    
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top).offset(0);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top).offset(44);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(1);
    }];
    
    [self.passText mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel.mas_top).offset(0);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.offset(44);
    }];
    
    [self.registerButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(17);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(35);
    }];
    
    [self.loginButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.registerButton.mas_bottom).offset(17);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.size.equalTo(CGSizeMake(100, 25));
    }];
}

#pragma mark -
#pragma mark - 懒加载

- (UILabel *)backLabel {
    if (!_backLabel) {
        
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _backLabel;
}

- (UITextField *)nameText {
    if (!_nameText) {
        _nameText = [[UITextField alloc]init];
        [_nameText setBorderStyle:(UITextBorderStyleNone)];
        _nameText.backgroundColor = [UIColor whiteColor];
        [_nameText setPlaceholder:@"请输入您的手机号"];
    }
    return _nameText;
}

- (UITextField *)passText {
    if (!_passText) {
        
        _passText = [[UITextField alloc]init];
        [_passText setBorderStyle:(UITextBorderStyleNone)];
        _passText.backgroundColor = [UIColor whiteColor];
        [_passText setPlaceholder:@"请输入您的密码"];
    }
    return _passText;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor grayColor];
    }
    return _lineLabel;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_registerButton setBackgroundImage:[UIImage imageNamed:@"登录界面登录按钮"] forState:(UIControlStateNormal)];
    }
    return _registerButton;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_loginButton setTitle:@"免费注册" forState:(UIControlStateNormal)];
        [_loginButton setTitleColor:RGB(55, 139, 179) forState:(UIControlStateNormal)];
        _loginButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _loginButton;
}

@end
