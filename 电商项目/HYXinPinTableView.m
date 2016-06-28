//
//  HYXinPinTableView.m
//  电商项目
//
//  Created by yan on 16/6/23.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYXinPinTableView.h"
#import "HYXinPinTableViewCell.h"

@interface HYXinPinTableView () <UITableViewDataSource , UITableViewDelegate>

@end

@implementation HYXinPinTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.tableFooterView = nil;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.muDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"id";
    HYXinPinTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HYXinPinTableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:ID];
    }
    

//    cell.nameLabel.text = model.title;
//    cell.priceLabel.text = model.price;
//    cell.iptLabel.text = model.goodsIntro;
//    cell.notionalImage.image = [UIImage imageNamed:model.countryImg];
    cell.model = self.muDataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}



@end
