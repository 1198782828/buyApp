//
//  HYVerificationCodeViewController.m
//  电商项目
//
//  Created by yan on 16/6/22.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYVerificationCodeViewController.h"
#import "HYVerificationCode.h"
//#import "HYLoginView.h"

@interface HYVerificationCodeViewController ()

@property (strong , nonatomic) HYVerificationCode * verifivation;

@end

@implementation HYVerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.view addSubview:self.verifivation];
    
}

- (HYVerificationCode *)verifivation {
    if (!_verifivation) {
        
        _verifivation = [[HYVerificationCode alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))];
        [_verifivation.rigtsterButton addTarget:self action:@selector(registerMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _verifivation;
}


///点击注册方法
- (void)registerMethod {
    
//    HYLoginView * loginVC = [[HYLoginView alloc]init];
    
    NSDictionary * dict = @{
                            @"LoginName":self.nameStr,
                            @"Lpassword":self.PassStr,
                            @"Code":_verifivation.VerficationText.text,
                            @"Telephone":self.tleStr
                            };
    [self GetRequestURl:@"appMember/appRegistration.do" parameter:dict requestSucceed:^(NSDictionary *dic) {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:(UIAlertControllerStyleActionSheet)];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
        [alert addAction:action];
        
    } requestError:^(NSError *error) {
        NSLog(@"error:%@",error.localizedDescription);
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
