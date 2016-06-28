//
//  HYLoginViewController.h
//  电商项目
//
//  Created by yan on 16/6/17.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYBaseViewController.H"

typedef void(^nameText)(NSString *);
typedef void(^passText)(NSString *);

@interface HYLoginViewController : HYBaseViewController

@property (copy , nonatomic) nameText nameTextBlock;
@property (copy , nonatomic) passText passTextBlock;

@end
