//
//  HYYetLoginView.m
//  电商项目
//
//  Created by yan on 16/6/20.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYYetLoginView.h"

@interface HYYetLoginView ()

@property (strong , nonatomic) UIImageView * headImage;

@property (strong , nonatomic) UILabel * nameLabel;

@property (strong , nonatomic) UILabel * vipLabel;

@property (strong , nonatomic) UIImageView * backImage;

@end

@implementation HYYetLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [self addSubview:self.backImage];
        [self addSubview:self.headImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.vipLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.height.equalTo(125);
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.left.equalTo(weakSelf.mas_left).offset(57);
        make.size.equalTo(CGSizeMake(75, 75));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(37);
        make.left.equalTo(weakSelf.headImage.mas_right).offset(39);
//        make.bottom.equalTo(weakSelf.vipLabel.mas_top).offset(20);
        make.size.equalTo(CGSizeMake(70, 16));
    }];
    
    [self.vipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.headImage.mas_right).offset(39);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-36);
        make.size.equalTo(CGSizeMake(70,16));
    }];
}

- (UIImageView *)backImage {
    if (!_backImage) {
        
        _backImage = [[UIImageView alloc]init];
        _backImage.image = [UIImage imageNamed:@"我的背景"];
    }
    return _backImage;
}

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"呵呵.jpg"];
        _headImage.layer.cornerRadius = 38;
        _headImage.layer.masksToBounds = YES;
    }
    return _headImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:16.0];
        _nameLabel.text = @"闫海豫";
    }
    return _nameLabel;
}

- (UILabel *)vipLabel {
    if (!_vipLabel) {
        _vipLabel = [[UILabel alloc]init];
        _vipLabel.textColor = [UIColor whiteColor];
        _vipLabel.font = [UIFont systemFontOfSize:16.0];
        _vipLabel.text = @"黄金会员";
    }
    return _vipLabel;
}

@end
