//
//  HYLoginView.m
//  电商项目
//
//  Created by yan on 16/6/17.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYLoginView.h"
#import "HYMasonryViewController.h"

@interface HYLoginView ()

@property (strong , nonatomic) UILabel * backLabel;

@property (strong , nonatomic) UILabel * label;

@property (strong , nonatomic) UITextField * nameText;

@property (strong , nonatomic) UILabel * lineLabel;

@property (strong , nonatomic) UITextField * passText;

@property (strong , nonatomic) UIButton * downButton;

@property (strong , nonatomic) UIButton * restrictButton;

@end

@implementation HYLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backLabel];
        [self addSubview:self.label];
        [self addSubview:self.nameText];
        [self addSubview:self.lineLabel];
        [self addSubview:self.passText];
        [self addSubview:self.downButton];
        [self addSubview:self.restrictButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(11);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.bottom.equalTo(weakSelf.backLabel.mas_top).offset(-11);
        make.height.equalTo(14);
    }];
    
    [self.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.label.mas_bottom).offset(11);
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
    
    [self.passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top).offset(44);
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
    
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(35);
    }];
    
    [self.restrictButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.downButton.mas_bottom).offset(17);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.size.equalTo(CGSizeMake(60, 40));
    }];
}

- (UILabel *)backLabel {
    if (!_backLabel) {
        
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
    }
    return _backLabel;
}

- (UILabel *)label {
    if (!_label) {
        
        _label = [[UILabel alloc]init];
        _label.text = @"请输入手机号注册新用户";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14.0];
        _label.textColor = [UIColor grayColor];
        _label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _label;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor grayColor];
    }
    return _lineLabel;
}

- (UITextField *)nameText {
    if (!_nameText) {
        _nameText = [[UITextField alloc]init];
        [_nameText setBorderStyle:(UITextBorderStyleNone)];
        _nameText.backgroundColor = [UIColor whiteColor];
        [_nameText setPlaceholder:@"请输入手机号"];
    }
    return _nameText;
}

- (UITextField *)passText {
    if (!_passText) {
        _passText = [[UITextField alloc]init];
        [_passText setBorderStyle:(UITextBorderStyleNone)];
        _passText.backgroundColor = [UIColor whiteColor];
        [_passText setPlaceholder:@"请输入密码"];
        [_passText setSecureTextEntry:YES];
    }
    return _passText;
}

- (UIButton *)downButton {
    if (!_downButton) {
        _downButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_downButton setBackgroundImage:[UIImage imageNamed:@"注册界面下一步按钮"] forState:(UIControlStateNormal)];
    }
    return _downButton;
}

- (UIButton *)restrictButton {
    if (!_restrictButton) {
        _restrictButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_restrictButton setTitle:@"去登陆" forState:(UIControlStateNormal)];
        _restrictButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_restrictButton addTarget:self action:@selector(gologinMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _restrictButton;
}

- (void)gologinMethod {
    HYMasonryViewController * masonryVC = [[HYMasonryViewController alloc]init];
    [self.viewController.navigationController pushViewController:masonryVC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
