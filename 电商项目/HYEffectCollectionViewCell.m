//
//  HYEffectCollectionViewCell.m
//  电商项目
//
//  Created by yan on 16/6/25.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYEffectCollectionViewCell.h"

@implementation HYEffectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = CGRectMake(10, 10, ((VIEW_WIDTH - 3) /4) - 25, ((VIEW_WIDTH - 3) /4) - 25);
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:(CGRectMake(0, ((VIEW_WIDTH - 3) / 4) - 15, (VIEW_WIDTH - 3) /4, 15))];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15.0];
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}

@end
