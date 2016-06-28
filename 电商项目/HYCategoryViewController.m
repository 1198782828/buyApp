//
//  HYCategoryViewController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYCategoryViewController.h"
#import "HYCollectionView.h"
#import "HYClassShopViewController.h"

@interface HYCategoryViewController () 

///底部scroll
@property (strong , nonatomic) UIScrollView * scrollView;

///网格
@property (strong , nonatomic) HYCollectionView * collection;

///功效分类数组
@property (strong , nonatomic) NSMutableArray * effectArray;

@end

@implementation HYCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [_scrollView addSubview:self.collection];
    
    [self httpGetEffectRequest];
    [self httpGetElseRequest];
    [self httpGetElesRequest];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT))];
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(VIEW_WIDTH, 800);
    }
    return  _scrollView;
}

- (HYCollectionView *)collection {
    if (!_collection) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.minimumLineSpacing = 1;
        flowLayout.itemSize = CGSizeMake((VIEW_WIDTH - 3) /4, (VIEW_WIDTH - 3) /4);
        flowLayout.headerReferenceSize = CGSizeMake(VIEW_WIDTH, 40);
        
        _collection = [[HYCollectionView alloc]initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 800)) collectionViewLayout:flowLayout];
        _collection.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collection.bounces = NO;
        _collection.showsHorizontalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _collection.ViewController = self;
    }
    return _collection;
}

- (void)httpGetEffectRequest {
    [self GetRequestURl:@"appBrandareatype/findBrandareatype.do" parameter:nil requestSucceed:^(id JSON) {
        
        NSArray * array = (NSArray *)JSON;
        
        NSMutableArray * muArray = [[NSMutableArray alloc]initWithCapacity:array.count];
        NSMutableArray * muArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary * dic in array) {
            [muArray addObject:dic[@"ImgView"]];
            [muArr addObject:dic[@"GoodsTypeName"]];
        }
        self.collection.effectArray = muArray;
        self.collection.effectArr = muArr;

        [self.collection reloadData];
        
    } requestError:^(NSError *error) {
        NSLog(@"error:%@",error.localizedDescription);
    }];
}

- (void)httpGetElseRequest {
    [self GetRequestURl:@"appBrandareanew/findBrandareanew.do" parameter:nil requestSucceed:^(id JSON) {
        NSArray * array = (NSArray *)JSON;
        NSMutableArray * muArray = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary * dic in array) {
            [muArray addObject:dic[@"ImgView"]];
        }
        self.collection.elseArray = muArray;
        [self.collection reloadData];
        
    } requestError:^(NSError *error) {
        ;
    }];
}


- (void)httpGetElesRequest {
    [self GetRequestURl:@"appBrandarea/asianBrand.do" parameter:nil requestSucceed:^(id JSON) {
        NSArray * array = (NSArray *)JSON;
        NSMutableArray * muArray = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary * dic in array) {
            [muArray addObject:dic[@"ImgView"]];
        }
        self.collection.elesArray = muArray;
        [self.collection reloadData];
        
    } requestError:^(NSError *error) {
        ;
    }];
}

- (NSMutableArray *)effectArray {
    if (_effectArray) {
        _effectArray = [NSMutableArray array];
    }
    return _effectArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
