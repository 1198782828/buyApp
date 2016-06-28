//
//  HYChangeButtonView.m
//  电商项目
//
//  Created by yan on 16/6/23.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYChangeButtonView.h"

@interface HYChangeButtonView ()

@end

@implementation HYChangeButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.XinPin];
        [self addSubview:self.PinPai];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    WS(weakSelf);
    [self.XinPin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH / 2, 50));
    }];
    
    [self.PinPai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.left.equalTo(weakSelf.mas_left).offset(VIEW_WIDTH/2);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH / 2, 50));
        
    }];
}

#pragma mark -
#pragma mark - 懒加载
- (UIButton *)XinPin {
    if (!_XinPin) {
        _XinPin = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_XinPin setImage:[UIImage imageNamed:@"新品团未选中"] forState:(UIControlStateNormal)];
        [_XinPin setImage:[UIImage imageNamed:@"新品团选中"] forState:(UIControlStateSelected)];
        [_XinPin setTitle:@"新品团购" forState:(UIControlStateNormal)];
        [_XinPin setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
        [_XinPin setTitleColor:[UIColor orangeColor] forState:(UIControlStateSelected)];
        [_XinPin setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
        [_XinPin setSelected:YES];

    }
    return _XinPin;
}

- (UIButton *)PinPai {
    if (!_PinPai) {
        _PinPai = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_PinPai setImage:[UIImage imageNamed:@"品牌团未选中"] forState:(UIControlStateNormal)];
        [_PinPai setImage:[UIImage imageNamed:@"品牌团选中"] forState:(UIControlStateSelected)];
        [_PinPai setTitle:@"品牌团购" forState:(UIControlStateNormal)];
        [_PinPai setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
        [_PinPai setTitleColor:[UIColor orangeColor] forState:(UIControlStateSelected)];
        [_PinPai setTitleEdgeInsets:(UIEdgeInsetsMake(0, 20, 0, 0))];
        
//        _PinPai.backgroundColor = [UIColor greenColor];
    }
    return _PinPai;
}

@end
