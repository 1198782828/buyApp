//
//  HYElseCollectionViewCell.m
//  电商项目
//
//  Created by yan on 16/6/25.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYElseCollectionViewCell.h"

@implementation HYElseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, (VIEW_WIDTH - 3) / 4, (VIEW_WIDTH - 3) / 4))];
    }
    return _imageView;
}

@end
