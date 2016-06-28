//
//  HYBaseViewController.m
//  电商项目
//
//  Created by yan on 16/6/16.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYBaseViewController.h"
#define URL @"http://123.57.141.249:8080/beautalk/"
#import <SVProgressHUD.h>

@implementation HYBaseSharedClient

+ (instancetype)sharedClient {
    static HYBaseSharedClient * baseShared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        baseShared = [[HYBaseSharedClient alloc]initWithBaseURL:[NSURL URLWithString:URL]];
        baseShared.responseSerializer = [AFJSONResponseSerializer serializer];
        baseShared.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });
    
    return baseShared;
}

@end

@interface HYBaseViewController ()

@end

@implementation HYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:[UIColor whiteColor]];

}

- (void)GetRequestURl:(NSString *)stringURL
            parameter:(NSDictionary *)dic
       requestSucceed:(requestSucceeed)succeed
         requestError:(requestError)fail {
    
    [SVProgressHUD show];

        [[HYBaseSharedClient sharedClient] GET:stringURL parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
            ;
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [SVProgressHUD dismiss];
            if (succeed) {
                succeed(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
            if (fail) {
                fail(error);
            }
    }];
    
}

- (void)PostRequestURl:(NSString *)stringURL
        requestSucceed:(requestSucceeed)succeed
          requestError:(requestError)fail
             parameter:(NSDictionary *)dic {
    
        [SVProgressHUD show];
    
    [[HYBaseSharedClient sharedClient] POST:stringURL parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
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
