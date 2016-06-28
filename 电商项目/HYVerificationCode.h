//
//  HYVerificationCode.h
//  电商项目
//
//  Created by yan on 16/6/22.
//  Copyright © 2016年 hy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYVerificationCode : UIView

///点击注册按钮
@property (strong , nonatomic) UIButton * rigtsterButton;

///再发一次验证码的button
@property (strong , nonatomic) UIButton * aginButton;

///输入验证码的框
@property (strong , nonatomic) UITextField * VerficationText;

@end
