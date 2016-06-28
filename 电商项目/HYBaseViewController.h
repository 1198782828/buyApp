//
//  HYBaseViewController.h
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

typedef void(^requestSucceeed)(id JSON);
typedef void(^requestError)(NSError * error);

@interface HYBaseSharedClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

@interface HYBaseViewController : UIViewController

/**
 get请求
 */
- (void)GetRequestURl:(NSString *)stringURL
           parameter:(NSDictionary *)dic
       requestSucceed:(requestSucceeed)succeed
         requestError:(requestError)fail;

/**
 post请求
 */
- (void)PostRequestURl:(NSString *)stringURL
        requestSucceed:(requestSucceeed)succeed
          requestError:(requestError)fail
            parameter:(NSDictionary *)dic;
@end

