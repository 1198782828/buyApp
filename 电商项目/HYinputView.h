//
//  HYinputView.h
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYinputView : UIView

@property (strong , nonatomic) UIButton * registerButton;

///账号
@property (strong , nonatomic) UITextField * nameText;
///密码
@property (strong , nonatomic) UITextField * passText;

@property (strong , nonatomic) UIViewController * viewController;

@end
