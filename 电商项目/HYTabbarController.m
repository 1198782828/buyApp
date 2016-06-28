//
//  HYTabbarController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYTabbarController.h"
#import "HYNavigationController.h"

@interface HYTabbarController ()

@property (strong , nonatomic) NSMutableArray * tabBarControllerArray;

@end

@implementation HYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * muarray = [NSMutableArray arrayWithCapacity:self.tabBarControllerArray.count];
    
    [self.tabBarControllerArray enumerateObjectsUsingBlock:^(NSDictionary * dic, NSUInteger idx, BOOL * _Nonnull stop) {
        
        Class viewControllerClass = NSClassFromString(dic[@"ViewController"]);
        UIViewController * viewController = [[viewControllerClass alloc]init];
        
        viewController.title = dic[@"title"];
        
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:dic[@"tabBarItemSelectedImage"]]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        viewController.tabBarItem.image = [[UIImage imageNamed:dic[@"tabBaritemImage"]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        HYNavigationController * navigationController = [[HYNavigationController alloc]initWithRootViewController:viewController];
        [muarray addObject:navigationController];
        
    }];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName : [UIFont systemFontOfSize:10.0],
                                                        NSForegroundColorAttributeName : [UIColor grayColor]
                                                        } forState:(UIControlStateNormal)];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName : [UIFont systemFontOfSize:10.0],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:69.0/255.0 green:179.0/255.0 blue:241.0/255.0 alpha:1]
                                                        } forState:(UIControlStateSelected)];
    
    self.viewControllers = muarray;
    self.selectedIndex = 1;
}

#pragma mark -
#pragma mark - 懒加载

- (NSMutableArray *)tabBarControllerArray {
    if (!_tabBarControllerArray) {
        _tabBarControllerArray = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"UITabbarPlist" ofType:@"plist"]];
    }
    return _tabBarControllerArray;
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
