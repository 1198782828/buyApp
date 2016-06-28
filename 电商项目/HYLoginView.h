//
//  HYLoginView.h
//  电商项目
//
//  Created by yan on 16/6/17.
//  Copyright © 2016年 hy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYLoginView : UIView

@property (strong , nonatomic) UIButton * downButton;

@property (strong , nonatomic) UIViewController * viewController;

///手机号
@property (strong , nonatomic) UITextField * nameText;

///密码
@property (strong , nonatomic) UITextField * passText;

@end
