//
//  HYVerificationCodeViewController.h
//  电商项目
//
//  Created by yan on 16/6/22.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYBaseViewController.H"

@interface HYVerificationCodeViewController : HYBaseViewController

///账号
@property (copy , nonatomic) NSString * nameStr;

///密码
@property (copy , nonatomic) NSString * PassStr;

///手机号
@property (copy , nonatomic) NSString * tleStr;

@end
