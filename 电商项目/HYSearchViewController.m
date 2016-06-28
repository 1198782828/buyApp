//
//  HYSearchViewController.m
//  电商项目
//
//  Created by yan on 16/6/27.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYSearchViewController.h"
#import "HYClassShopViewController.h"

@interface HYSearchViewController () <UISearchBarDelegate>

///搜索框
@property (strong , nonatomic) UISearchBar * searchBar;

@end

@implementation HYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///搜索框
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc]initWithCustomView:self.searchBar];
    self.navigationItem.rightBarButtonItem = barButton;
}

#pragma mark -
#pragma mark - 懒加载 初始化

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        
        //初始化
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH - 50, 40)];
        //        占位符
        [_searchBar setPlaceholder:@"placehloder"];
        //        顶部提示文本
        [_searchBar setPrompt:@"prompt"];
        //        样式
        [_searchBar setBarStyle:(UIBarStyleDefault)];
        //        搜索框的偏移量
        [_searchBar setSearchTextPositionAdjustment:(UIOffsetMake(0, 0))];
        //        设置键盘样式
        [_searchBar setKeyboardType:(UIKeyboardTypeAlphabet)];
        //        右侧书图片
        //        [_searchBar setShowsBookmarkButton:YES];
        //取消按钮
        [_searchBar setShowsCancelButton:YES];
        _searchBar.delegate = self;
        
    }
    return _searchBar;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //收起键盘
    [self.searchBar resignFirstResponder];
}

///点击取消的方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    //收起键盘
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    
    HYClassShopViewController * ClassShopVC = [[HYClassShopViewController alloc]init];
    [self.navigationController pushViewController:ClassShopVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
