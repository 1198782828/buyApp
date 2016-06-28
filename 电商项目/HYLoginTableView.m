//
//  HYLoginTableView.m
//  电商项目
//
//  Created by yan on 16/6/20.
//  Copyright © 2016年 hy. All rights reserved.
//

//17721025595     123123

#import "HYLoginTableView.h"

@interface HYLoginTableView () <UITableViewDataSource,UITableViewDelegate>

///数据源数组
@property (strong , nonatomic) NSArray * dataArray;

@end

@implementation HYLoginTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        
        _dataArray = [[NSArray alloc]init];
        _dataArray =   @[@{@"image":@"我的界面我的收藏图标",
                           @"title":@"我的收藏",
                           @"img":@"下一步"},
                         @{@"image":@"我的界面意见反馈图标",
                           @"title":@"意见反馈",
                           @"img":@"下一步"},
                         @{@"image":@"我的界面关于我们图标",
                           @"title":@"关于我们",
                           @"img":@"下一步"},
                         @{@"image":@"我的界面客服热线图标",
                           @"title":@"客服热线",
                           @"img":@"客服电话"},
                         @{@"image":@"我的界面我的优惠券图标",
                           @"title":@"我的优惠券",
                           @"img":@"下一步"},
                         @{@"image":@"我的界面邀请好友图标",
                           @"title":@"邀请好友,立即赚钱",
                           @"img":@"下一步"}];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary * login = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
    if (login.count != 0 ) {
        return 6;
    }else
        return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"id";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:ID];
    }
    
    if (indexPath.row == 3) {
        cell.detailTextLabel.text = @"400-6010-545";
        
    };

    cell.textLabel.text = [self.dataArray[indexPath.row]objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:[self.dataArray[indexPath.row]objectForKey:@"image"]];
    
    if (indexPath.row != 3) {
        
        //设置tableviewcell最右边的箭头 >
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView * image = [[UIImageView alloc]initWithFrame:(CGRectMake(self.frame.size.width - 30, 7, 15, 20))];
        image.image = [UIImage imageNamed:[self.dataArray[indexPath.row]objectForKey:@"img"]];
        [cell addSubview:image];
    };
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
