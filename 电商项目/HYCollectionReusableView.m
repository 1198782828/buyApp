//
//  HYCollectionReusableView.m
//  电商项目
//
//  Created by yan on 16/6/25.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYCollectionReusableView.h"

@interface HYCollectionReusableView ()

@property (strong , nonatomic) UILabel * label;

@end

@implementation HYCollectionReusableView

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.font = [UIFont systemFontOfSize:17.0];
        _label.textColor = [UIColor blackColor];
//        _label.backgroundColor = [UIColor whiteColor];
        
    }
    return _label;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    WS(weakSelf);
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15, 0, 0));
    }];
}

- (void)setTitleText:(NSString *)titleText {
    _label.text   = titleText;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
    }
    return self;
}

@end
