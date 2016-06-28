//
//  HYThirdLogin.m
//  电商项目
//
//  Created by yan on 16/6/21.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYThirdLogin.h"

@implementation HYThirdLogin

+ (void)WinXinloginSucceed:(LoginSucceed)succeed
          loginError:(LoginError)error
          controller:(UIViewController *)VC {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(VC,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            if (succeed) {
                succeed(dict);
            }
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
        }
        if (error) {
            error();
        }
    });
}

+ (void)QQLoginSucceed:(LoginSucceed)succeed loginError:(LoginError)error controller:(UIViewController *)VC {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
        snsPlatform.loginClickHandler(VC,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
    
            //          获取微博用户名、uid、token等
    
            if (response.responseCode == UMSResponseCodeSuccess) {
    
                NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                if (succeed) {
                    succeed(dict);
                }
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            }
            if (error) {
                error();
            }
        });
}

+ (void)SinaLoginSucceed:(LoginSucceed)succeed
              loginError:(LoginError)error
              controller:(UIViewController *)VC {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(VC,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            if (succeed) {
                succeed(dict);
            }

            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
        }
        if (error) {
            error();
        }
    });
}

@end
