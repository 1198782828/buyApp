//
//  HYPinPaiTableViewCell.m
//  电商项目
//
//  Created by yan on 16/6/25.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYPinPaiTableViewCell.h"

@interface HYPinPaiTableViewCell ()

@end

@implementation HYPinPaiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.Image];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (UIImageView *)Image {
    if (!_Image) {
        _Image = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 165))];
    }
    return _Image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
