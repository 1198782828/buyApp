//
//  HYCollectionView.m
//  电商项目
//
//  Created by yan on 16/6/25.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYCollectionView.h"
#import "HYCollectionReusableView.h"
#import "HYEffectCollectionViewCell.h"
#import "HYElseCollectionViewCell.h"
#import "HYClassShopViewController.h"
#import <UIImageView+WebCache.h>

@interface HYCollectionView () <UICollectionViewDataSource , UICollectionViewDelegate>

@end

@implementation HYCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
    }
    ///功效
    [self registerClass:[HYEffectCollectionViewCell class] forCellWithReuseIdentifier:@"HYEffectCollectionViewCell"];
    //另外两个
    [self registerClass:[HYElseCollectionViewCell class] forCellWithReuseIdentifier:@"HYElseCollectionViewCell"];
    [self registerClass:[HYCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HYCollectionReusableView"];
    
    return self;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        HYCollectionReusableView * reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HYCollectionReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            reusableView.titleText = @"功效分类";
        }
        else if (indexPath.section == 1) {
            reusableView.titleText = @"推荐品牌";
        }
        else {
            reusableView.titleText = @"经典品牌";
        }
        return reusableView;
    }
    return nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        HYEffectCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYEffectCollectionViewCell" forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.effectArray[indexPath.row]]];
        cell.label.text = self.effectArr[indexPath.row];
        return cell;
    }
    
    if (indexPath.section == 1) {
        HYElseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYElseCollectionViewCell" forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.elesArray[indexPath.row]]];
        return cell;
    }
    if (indexPath.section == 2) {
        HYElseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYElseCollectionViewCell" forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.elseArray[indexPath.row]]];
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HYClassShopViewController * classShopVC = [[HYClassShopViewController alloc]init];
    [self.ViewController.navigationController pushViewController:classShopVC animated:YES];
}

@end
