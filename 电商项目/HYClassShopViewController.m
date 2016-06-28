//
//  HYClassShopViewController.m
//  电商项目
//
//  Created by yan on 16/6/27.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYClassShopViewController.h"
#import "HYClassShopCollectionView.h"

@interface HYClassShopViewController ()

///热门
@property (strong , nonatomic) UIButton * hotButton;

///价格
@property (strong , nonatomic) UIButton * priceButton;

///好评
@property (strong , nonatomic) UIButton * GoodButton;

///新品
@property (strong , nonatomic) UIButton * newButton;

///按钮下面的线
@property (strong , nonatomic) UILabel * lineLabel;

///collection
@property (strong , nonatomic) HYClassShopCollectionView * collection;

@end

@implementation HYClassShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    [self.view addSubview:self.collection];
    [self.view addSubview:self.hotButton];
    [self.view addSubview:self.priceButton];
    [self.view addSubview:self.GoodButton];
    [self.view addSubview:self.newButton];
    [self.view addSubview:self.lineLabel];
    
    WS(weakSelf);
    [self.hotButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH / 4, 30));
    }];
    
    [self.priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.hotButton.mas_right);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH / 4, 30));
    }];
    
    [self.GoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.priceButton.mas_right);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH / 4, 30));
    }];
    
    [self.newButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.GoodButton.mas_right);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH / 4, 30));
    }];

}

#pragma mark -
#pragma mark - 网络请求
//根据品牌
- (void)httpGetBrandRequest {
    
    NSDictionary * dic = @{
                           @"OrderName":@"host",
                           @"OrderType":@"ASC",
                           @"":@""
                           };
    
    [self GetRequestURl:@"appShop /appShopGoodsList.do" parameter:dic requestSucceed:^(id JSON) {
        
        
    } requestError:^(NSError *error) {
        ;
    }];
}

#pragma mark -
#pragma mark - 懒加载collection

- (HYClassShopCollectionView *)collection {
    if (!_collection) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 5;
        flowLayout.itemSize = CGSizeMake(VIEW_WIDTH / 2 - 5, 250);
        
        _collection = [[HYClassShopCollectionView alloc]initWithFrame:(CGRectMake(0, 35, VIEW_WIDTH, VIEW_HEIGHT)) collectionViewLayout:flowLayout];
        _collection.bounces = NO;
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.showsVerticalScrollIndicator = NO;
        
    }
    return _collection;
}

#pragma mark -
#pragma mark - 懒加载4个button 一个line

- (UIButton *)hotButton {
    if (!_hotButton) {
        _hotButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_hotButton setTintColor:[UIColor whiteColor]];
        [_hotButton setTitle:@"热门" forState:(UIControlStateNormal)];
        _hotButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_hotButton setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [_hotButton addTarget:self action:@selector(buttonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _hotButton;
}

- (UIButton *)priceButton {
    if (!_priceButton) {
        _priceButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_priceButton setTintColor:[UIColor whiteColor]];
        [_priceButton setTitle:@"价格" forState:(UIControlStateNormal)];
        _priceButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_priceButton setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [_priceButton addTarget:self action:@selector(buttonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
         }
    return _priceButton;
}

- (UIButton *)GoodButton {
    if (!_GoodButton) {
        _GoodButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_GoodButton setTintColor:[UIColor whiteColor]];
        [_GoodButton setTitle:@"好评" forState:(UIControlStateNormal)];
        _GoodButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_GoodButton setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [_GoodButton addTarget:self action:@selector(buttonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        
           }
    return _GoodButton;
}

- (UIButton *)newButton {
    if (!_newButton) {
        _newButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_newButton setTintColor:[UIColor whiteColor]];
        [_newButton setTitle:@"新品" forState:(UIControlStateNormal)];
        _newButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_newButton setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [_newButton addTarget:self action:@selector(buttonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        
           }
    return _newButton;
}

- (void)buttonMethod:(UIButton *)sender {
    if (sender == self.hotButton) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.lineLabel.frame;
            rect.origin.x = VIEW_WIDTH / 4 / 3;
            self.lineLabel.frame = rect;
        }];
    }
    else if (sender == self.priceButton) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.lineLabel.frame;
            rect.origin.x = VIEW_WIDTH / 4 + VIEW_WIDTH / 11;
            self.lineLabel.frame = rect;
        }];
    }
    else if (sender == self.GoodButton) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.lineLabel.frame;
            rect.origin.x = VIEW_WIDTH / 4 + VIEW_WIDTH / 3;
            self.lineLabel.frame = rect;
        }];
    }
    else {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.lineLabel.frame;
            rect.origin.x = VIEW_WIDTH - VIEW_WIDTH / 6;
            self.lineLabel.frame = rect;
        }];    }
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]initWithFrame:(CGRectMake(VIEW_WIDTH / 4 / 3, 30, VIEW_WIDTH / 4 / 3, 2))] ;
        _lineLabel.backgroundColor = [UIColor cyanColor];
    }
    return _lineLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
