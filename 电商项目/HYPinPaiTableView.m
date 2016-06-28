//
//  HYPinPaiTableView.m
//  电商项目
//
//  Created by yan on 16/6/23.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYPinPaiTableView.h"
#import "HYPinPaiTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "HYClassShopViewController.h"

@interface HYPinPaiTableView () <UITableViewDataSource , UITableViewDelegate>

@end

@implementation HYPinPaiTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 175;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"id";
    HYPinPaiTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HYPinPaiTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    
    [cell.Image sd_setImageWithURL:[NSURL URLWithString:self.array[indexPath.row]]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HYClassShopViewController * classShopVC = [[HYClassShopViewController alloc]init];
    [self.viewController.navigationController pushViewController:classShopVC animated:YES];
}

@end
