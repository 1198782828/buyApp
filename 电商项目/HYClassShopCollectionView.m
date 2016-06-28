//
//  HYClassShopCollectionView.m
//  电商项目
//
//  Created by yan on 16/6/27.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYClassShopCollectionView.h"

@interface HYClassShopCollectionView () <UICollectionViewDataSource , UICollectionViewDelegate>

@property (strong , nonatomic) UIImageView * imageView;

@property (strong , nonatomic) UILabel * nameLabel;

@property (strong , nonatomic) UILabel * priceLabel;

@end

@implementation HYClassShopCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self addSubview:self.imageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.priceLabel];
        self.delegate = self;
        self.dataSource = self;

    }
//    [self registerClass:[HYClassShopCollectionView class] forCellWithReuseIdentifier:@"HYClassShopCollectionView"];
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    return self;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 2;
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UILabel *)priceLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor orangeColor];
        _nameLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return _nameLabel;
}

@end
