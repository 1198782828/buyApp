//
//  HYThirdLogin.h
//  电商项目
//
//  Created by yan on 16/6/21.
//  Copyright © 2016年 hy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocial.h>

typedef void(^LoginSucceed)(NSDictionary * dic);
typedef void(^LoginError)();

@interface HYThirdLogin : NSObject

+ (void)WinXinloginSucceed:(LoginSucceed)succeed
          loginError:(LoginError)error
          controller:(UIViewController *)VC;
+ (void)QQLoginSucceed:(LoginSucceed)succeed
            loginError:(LoginError)error
            controller:(UIViewController *)VC;
+ (void)SinaLoginSucceed:(LoginSucceed)succeed
            loginError:(LoginError)error
            controller:(UIViewController *)VC;

@end
