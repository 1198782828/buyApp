//
//  HYMineViewController.h
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYBaseViewController.h"
#import "HYLoginDialog.h"
#import "HYLoginTableView.h"
#import "HYYetLoginView.h"

@interface HYMineViewController : HYBaseViewController

///退出登录按钮
@property (strong , nonatomic) UIButton * exitBtn;

///已登录用户框
@property (strong , nonatomic) HYYetLoginView * yetLogin;

///未登录用户框
@property (strong , nonatomic)HYLoginDialog * loginDialog;

@end
