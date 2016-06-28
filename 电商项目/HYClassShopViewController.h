//
//  HYClassShopViewController.h
//  电商项目
//
//  Created by yan on 16/6/27.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYBaseViewController.H"

@interface HYClassShopViewController : HYBaseViewController

//数据源
@property (strong , nonatomic) NSMutableArray * brandArray;

///url
@property (strong , nonatomic) NSString * URL;

///参数字典
@property (strong , nonatomic) NSDictionary * dic;

@end
