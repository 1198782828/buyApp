//
//  HYXinPinTableViewCell.m
//  电商项目
//
//  Created by yan on 16/6/24.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYXinPinTableViewCell.h"
#import "HYXinPinModel.h"
#import <UIImageView+WebCache.h>

@interface HYXinPinTableViewCell ()

///加入购物车按钮button
@property (strong , nonatomic) UIButton * shoppingCartButton;


///国旗图片
@property (strong , nonatomic) UIImageView * notionalImage;

///商品展示图片imageview
@property (strong , nonatomic)UIImageView * commodityImage;

///商品名字label
@property (strong , nonatomic) UILabel * nameLabel;

///商品介绍
@property (strong , nonatomic) UILabel * iptLabel;

///价格label
@property (strong , nonatomic) UILabel * priceLabel;

@end

@implementation HYXinPinTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.commodityImage];
        [self.commodityImage addSubview:self.notionalImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.iptLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.shoppingCartButton];
    }
    return self;
}

- (void)setModel:(HYXinPinModel *)model {
    _model = model;
    [self.commodityImage sd_setImageWithURL:[NSURL URLWithString:model.imgView]];
    [self.notionalImage sd_setImageWithURL:[NSURL URLWithString:model.countryImg]];
    self.nameLabel.text = model.title;
    
    NSString * str1 = [NSString stringWithFormat:@"%@  ",model.price];
    NSDictionary * dic1 = @{
                            NSFontAttributeName : [UIFont systemFontOfSize:18.0],
                            NSForegroundColorAttributeName : [UIColor orangeColor]
                            };
    NSAttributedString * attStr1 = [[NSAttributedString alloc]initWithString:str1 attributes:dic1];
    
    NSString * str2 = model.domesticPrice;
    NSDictionary * dic2 = @{
                            NSFontAttributeName : [UIFont systemFontOfSize:14.0],
                            NSForegroundColorAttributeName : [UIColor grayColor],
                            NSStrikethroughStyleAttributeName : @1
                            };
    NSAttributedString * attSre2 = [[NSAttributedString alloc]initWithString:str2 attributes:dic2];
    
    NSMutableAttributedString * muAttStr = [[NSMutableAttributedString alloc]init];
    [muAttStr insertAttributedString:attStr1 atIndex:0];
    [muAttStr insertAttributedString:attSre2 atIndex:[attStr1 length]];
    
    self.priceLabel.attributedText = muAttStr;
    self.iptLabel.text = model.goodsIntro;
}

#pragma mark -
#pragma mark - 约束
- (void)layoutSubviews {
    [super layoutSubviews];
    
    WS(weakSelf);
    [self.commodityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(142, 142));
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(12);
    }];
    
    [self.notionalImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.commodityImage.mas_top).offset(10);
        make.left.equalTo(weakSelf.commodityImage.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.commodityImage.mas_right).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
        make.height.equalTo(15);
    }];
    
    
    [self.iptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.mas_bottom);
        make.height.equalTo(60);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
        make.left.equalTo(weakSelf.commodityImage.mas_right).offset(10);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(17);
        make.left.equalTo(weakSelf.commodityImage.mas_right).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-27);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
    }];
    
    [self.shoppingCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
        make.size.equalTo(CGSizeMake(35, 35));
    }];
    
    [self.shoppingCartButton setBackgroundImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:(UIControlStateNormal)];
    
    
}

#pragma mark -
#pragma mark - 懒加载
///国旗图片
- (UIImageView *)notionalImage {
    if (!_notionalImage) {
        _notionalImage = [[UIImageView alloc]init];
    }
    return _notionalImage;
}

- (UIImageView *)commodityImage {
    if (!_commodityImage) {
        _commodityImage = [[UIImageView alloc]init];
    }
    return _commodityImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = [UIColor darkGrayColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:17.0];
        _nameLabel.backgroundColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UILabel *)iptLabel {
    if (!_iptLabel) {
        _iptLabel = [[UILabel alloc]init];
        _iptLabel.numberOfLines = 3;
        _iptLabel.font = [UIFont systemFontOfSize:15.0];
        _iptLabel.backgroundColor = [UIColor whiteColor];
    }
    return _iptLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.backgroundColor = [UIColor whiteColor];
    }
    return _priceLabel;
}

- (UIButton *)shoppingCartButton {
    if (!_shoppingCartButton) {
        _shoppingCartButton = [[UIButton alloc]init];
    }
    return _shoppingCartButton;
}

@end
