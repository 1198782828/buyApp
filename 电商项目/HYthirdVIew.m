//
//  HYthirdVIew.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYthirdVIew.h"

@interface HYthirdVIew ()

@property (strong , nonatomic) UILabel * lineLabel;
@property (strong , nonatomic) UILabel * label;

@end

@implementation HYthirdVIew

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.label];
        [self addSubview:self.QQbutton];
        [self addSubview:self.WXbutton];
        [self addSubview:self.WBbutton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(12);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(1);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.centerX.equalTo(weakSelf.lineLabel.mas_centerX).offset(0);
        make.size.equalTo(CGSizeMake(100, 25));
    }];
    
    [self.QQbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.label.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.mas_left).offset(61);
        make.size.equalTo(CGSizeMake(45, 45));
    }];
    
    [self.WXbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.label.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.QQbutton.mas_right).offset(60);
        make.size.equalTo(CGSizeMake(45, 45));
    }];
    
    [self.WBbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.label.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.WXbutton.mas_right).offset(60);
        make.size.equalTo(CGSizeMake(45, 45));
    }];
}

- (UIButton *)WXbutton {
    if (!_WXbutton) {
        _WXbutton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_WXbutton setBackgroundImage:[UIImage imageNamed:@"登录界面微信登录"] forState:(UIControlStateNormal)];
    }
    return _WXbutton;
}

- (UIButton *)QQbutton {
    if (!_QQbutton) {
        _QQbutton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_QQbutton setBackgroundImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:(UIControlStateNormal)];
    }
    return _QQbutton;
}

- (UIButton *)WBbutton {
    if (!_WBbutton) {
        _WBbutton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_WBbutton setBackgroundImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:(UIControlStateNormal)];
    }
    return _WBbutton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(191, 192, 193);
    }
    return _lineLabel;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"一键登录";
        _label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _label.textColor = RGB(191, 192, 191);
        _label.font = [UIFont systemFontOfSize:20];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
