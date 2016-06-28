//
//  HYTimeViewController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYTimeViewController.h"
#import <SDCycleScrollView.h>
#import "HYChangeButtonView.h"
#import "HYXinPinTableView.h"
#import "HYPinPaiTableView.h"
#import "HYXinPinModel.h"
#import "HYSearchViewController.h"

@interface HYTimeViewController () <UIScrollViewDelegate,SDCycleScrollViewDelegate>

///首页scroll
@property (strong , nonatomic) SDCycleScrollView * GGScrollView;

///底部scroll
@property (strong , nonatomic) UIScrollView * scrollView;

///图片数组
@property (strong , nonatomic) NSMutableArray * imageArray;

///切换table的两个button
@property (strong , nonatomic) HYChangeButtonView * changeBtn;

///新品tableview
@property (strong , nonatomic) HYXinPinTableView * XinPinTable;

///品牌tabview
@property (strong , nonatomic) HYPinPaiTableView * PinPaiTable;

///新品的数据源数组
@property (strong , nonatomic) NSMutableArray * muArray;

///品牌的数据源数组
@property (strong , nonatomic) NSMutableArray * PmuArray;

///
@property (strong , nonatomic) UISearchBar * searchBar;

@end

@implementation HYTimeViewController

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 40))];
    }
    return _searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    
    ///new的网络请求
    [self httpGETRequestNew];
    
    ///广告位的网络请求
    [self httpGetRequestSDY];
    
    ///品牌的网路请求
    [self httpGetRequestPinPai];
    
    [self.scrollView addSubview:self.XinPinTable];
    [self.scrollView addSubview:self.PinPaiTable];
    [self.scrollView addSubview:self.changeBtn];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"限时特卖界面搜索按钮"] style:(UIBarButtonItemStylePlain) target:self action:@selector(searchMethod)];
    button.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = button;
    
}

#pragma mark -
#pragma mark - 搜索方法
- (void)searchMethod {
    HYSearchViewController * searchVC = [[HYSearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark -
#pragma mark - 首页广告位的网路请求
- (void)httpGetRequestSDY {
    //网络请求图片
    [self GetRequestURl:@"appHome/appHome.do" parameter:nil requestSucceed:^(NSArray * scrollArr) {
        self.imageArray = [NSMutableArray array];
        for (NSDictionary * dic in scrollArr) {
            [self.imageArray addObject:dic[@"ImgView"]];
        }
        [self.scrollView addSubview:self.GGScrollView];
    } requestError:^(NSError *error) {
        ;
     }];
}

#pragma mark -
#pragma mark - 第二个table的网络请求
- (void)httpGetRequestPinPai {
    
    WS(weakSelf);
    [self GetRequestURl:@"appActivity/appActivityList.do" parameter:nil requestSucceed:^(id JSON) {
        
        NSArray * array = (NSArray *)JSON;
        if (array.count != 0) {
            NSMutableArray * MuArray = [[NSMutableArray alloc]initWithCapacity:array.count];
            for (NSDictionary * dic in array) {
                [MuArray addObject:dic[@"ImgView"]];
            }
            
            [self.PmuArray addObjectsFromArray:MuArray];
            weakSelf.PinPaiTable.array = weakSelf.PmuArray;
            [self.PinPaiTable reloadData];
        }
        
    } requestError:^(NSError *error) {
        NSLog(@"error:%@",error.localizedDescription);
    }];
}

#pragma mark -
#pragma mark - new网络请求
- (void)httpGETRequestNew {
    
    WS(weakSelf);
    [self GetRequestURl:@"appActivity/appHomeGoodsList.do" parameter:nil requestSucceed:^(id JSON) {
        
        NSArray *array = (NSArray *)JSON;
        
        if (array.count > 0) {
            NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
            
            for (NSDictionary *dict in array) {
                HYXinPinModel *model = [[HYXinPinModel alloc] initWithDictionary:dict];
                [muArray addObject:model];
            }
            
            [weakSelf.muArray addObjectsFromArray:muArray];
            
            weakSelf.XinPinTable.muDataArray = weakSelf.muArray;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.XinPinTable reloadData];
            });
        }
        else {
            NSLog(@"---------------");
        }
        
    } requestError:^(NSError *error) {
        NSLog(@"=====%@",error);
    }];
   
}

#pragma mark -
#pragma mark - 懒加载

- (NSMutableArray *)PmuArray {
    if (!_PmuArray) {
        _PmuArray = [NSMutableArray array];
    }
    return _PmuArray;
}

- (NSMutableArray *)muArray {
    if (!_muArray) {
        
        _muArray = [NSMutableArray array];
        
    }
    return _muArray;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, VIEW_HEIGHT))];
        _scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [_scrollView setContentSize:(CGSizeMake(VIEW_WIDTH,1700 + 280 + 64 + 49))];
        [_scrollView setContentOffset:(CGPointMake(0, 0))];
        [_scrollView setAlwaysBounceVertical:YES];
    }
    return _scrollView;
}

- (SDCycleScrollView *)GGScrollView {
    if (!_GGScrollView) {
        _GGScrollView = [SDCycleScrollView cycleScrollViewWithFrame:(CGRectMake(0, 0, VIEW_WIDTH, 230)) delegate:self placeholderImage:nil];
        [_GGScrollView setAutoScroll:YES];
        [_GGScrollView setImageURLStringsGroup:self.imageArray];
        [_GGScrollView setInfiniteLoop:YES];
        [_GGScrollView setAutoScrollTimeInterval:1.5];
    }
    return _GGScrollView;
}

- (HYXinPinTableView *)XinPinTable {
    if (!_XinPinTable) {
        _XinPinTable = [[HYXinPinTableView alloc]initWithFrame:(CGRectMake(0, 280, VIEW_WIDTH,1700)) style:(UITableViewStylePlain)];
        
    }
    return _XinPinTable;
}

- (HYPinPaiTableView *)PinPaiTable {
    if (!_PinPaiTable) {
        _PinPaiTable = [[HYPinPaiTableView alloc]initWithFrame:(CGRectMake(2 * VIEW_WIDTH, 280, VIEW_WIDTH,2100)) style:(UITableViewStylePlain)];
        _PinPaiTable.viewController = self;
    }
    return _PinPaiTable;
}

- (HYChangeButtonView *)changeBtn {
    if (!_changeBtn) {
        _changeBtn = [[HYChangeButtonView alloc]initWithFrame:(CGRectMake(0, 230, VIEW_WIDTH, 50))];
        _changeBtn.backgroundColor = [UIColor whiteColor];
        [_changeBtn.XinPin addTarget:self action:@selector(changeTable:) forControlEvents:(UIControlEventTouchUpInside)];
        [_changeBtn.PinPai addTarget:self action:@selector(changeTable:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _changeBtn;
}


#pragma mark -
#pragma mark - 两个button的点击方法
- (void)changeTable:(UIButton *)sender {
    
    if (sender == _changeBtn.XinPin) {
        
        [self.scrollView setContentSize:(CGSizeMake(VIEW_WIDTH, self.muArray.count * 170 + 280 + 64 + 49))];
        
        WS(weakSelf);
        weakSelf.scrollView.contentOffset = CGPointMake(0, 230);
        
        [UIView animateWithDuration:0.3 animations:^{

            _changeBtn.XinPin.selected = YES;
            _changeBtn.PinPai.selected = NO;
            
            CGRect rect = weakSelf.XinPinTable.frame;
            rect.size.height = weakSelf.muArray.count * 170;
            rect.origin.x = 0;
            weakSelf.XinPinTable.frame = rect;
            
            CGRect rect1 = weakSelf.PinPaiTable.frame;
            rect1.origin.x = 2 * VIEW_WIDTH;
            weakSelf.PinPaiTable.frame = rect1;
        }];
    }
    else {
        
        [self.scrollView setContentSize:(CGSizeMake(VIEW_WIDTH, self.PmuArray.count * 175 + 280 + 64 + 49))];
        
        WS(weakSelf);
        weakSelf.scrollView.contentOffset = CGPointMake(0, 230);

        [UIView animateWithDuration:0.3 animations:^{
            
            _changeBtn.XinPin.selected = NO;
            _changeBtn.PinPai.selected = YES;
            
            CGRect rect = weakSelf.XinPinTable.frame;
            rect.origin.x = - VIEW_WIDTH;
            weakSelf.XinPinTable.frame = rect;
            
            CGRect rect1 = weakSelf.PinPaiTable.frame;
            rect1.origin.x = 0;
            weakSelf.PinPaiTable.frame = rect1;
        }];
    }
  }

#pragma mark -
#pragma mark - scrollView  -  delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:_scrollView]) {
        
        if (scrollView.contentOffset.y >= 230) {
            CGRect rect = self.changeBtn.frame;
            rect.origin.y = scrollView.contentOffset.y;
            self.changeBtn.frame = rect;
        }
        else {
            self.changeBtn.frame = Rect(0, 230, VIEW_WIDTH, 50);
        }

    }
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
