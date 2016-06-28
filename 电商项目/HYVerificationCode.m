//
//  HYVerificationCode.m
//  电商项目
//
//  Created by yan on 16/6/22.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYVerificationCode.h"

@interface HYVerificationCode ()

///提示label
@property (strong , nonatomic) UILabel * promptLabel;

///发送验证码按钮
@property (strong , nonatomic) UIButton * sendButton;

///提示多少秒
@property (strong , nonatomic) UILabel * label;

///分割线
@property (strong , nonatomic) UILabel * lineLabel;

///倒计时定时器
@property (strong , nonatomic) NSTimer * timer;

@end

@implementation HYVerificationCode

static int number = 60;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        
        [self addSubview:self.promptLabel];
        [self addSubview:self.VerficationText];
        [self addSubview:self.rigtsterButton];
        [self addSubview:self.aginButton];
        [self addSubview:self.sendButton];
        self.sendButton.hidden = YES;
        [self addSubview:self.label];
        [self addSubview:self.lineLabel];
    }
    return self;
}

#pragma mark -
#pragma mark - 约束

- (void)layoutSubviews {
    [super layoutSubviews];
    WS(weakSelf);
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.height.equalTo(35);
    }];
    
    [self.VerficationText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.promptLabel.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(-100);
        make.height.equalTo(43);
    }];
    
    [self.rigtsterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.VerficationText.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(35);
    }];
    
    [self.aginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.rigtsterButton.mas_bottom).offset(22);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.equalTo(CGSizeMake(160, 20));
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.VerficationText.mas_centerY);
        make.left.equalTo(weakSelf.VerficationText.mas_right).offset(0);
        make.size.equalTo(CGSizeMake(100, 20));
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.VerficationText.mas_centerY);
        make.left.equalTo(weakSelf.VerficationText.mas_right).offset(0);
        make.size.equalTo(CGSizeMake(100, 20));
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.VerficationText.mas_top).offset(5);
        make.left.equalTo(weakSelf.VerficationText.mas_right).offset(0);
        make.size.equalTo(CGSizeMake(1, 34));
    }];
}

#pragma mark -
#pragma mark - 懒加载
- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc]init];
        
        NSString * str = [NSString stringWithFormat:@"验证码已发送到"];
        NSDictionary * dic = @{
                               NSForegroundColorAttributeName : [UIColor grayColor]
                               };
        NSAttributedString * attString = [[NSAttributedString alloc]initWithString:str attributes:dic];
        
        NSString * string = [NSString stringWithFormat:@" +86"];
        NSDictionary * dictionary = @{
                                      NSForegroundColorAttributeName : [UIColor cyanColor]
                                      };
        NSAttributedString * attributed = [[NSAttributedString alloc]initWithString:string attributes:dictionary];
        NSMutableAttributedString * muAttributed = [[NSMutableAttributedString alloc]init];
        [muAttributed insertAttributedString:attString atIndex:0];
        [muAttributed insertAttributedString:attributed atIndex:[attString length]];
        
        _promptLabel.attributedText = muAttributed;
        _promptLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _promptLabel;
}

- (UITextField *)VerficationText {
    if (!_VerficationText) {
        _VerficationText = [[UITextField alloc]init];
        [_VerficationText setBorderStyle:(UITextBorderStyleNone)];
        _VerficationText.backgroundColor = [UIColor whiteColor];
    }
    return _VerficationText;
}

- (UIButton *)rigtsterButton {
    if (!_rigtsterButton) {
        _rigtsterButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_rigtsterButton setTitle:@"注  册" forState:(UIControlStateNormal)];
        _rigtsterButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_rigtsterButton setBackgroundColor:[UIColor cyanColor]];
        [_rigtsterButton.layer setCornerRadius:10];
        _rigtsterButton.layer.masksToBounds = YES;
    }
    return _rigtsterButton;
}

- (UIButton *)aginButton {
    if (!_aginButton) {
        _aginButton = [[UIButton alloc]init];
        [_aginButton setTitle:@"重新发送验证码" forState:(UIControlStateNormal)];
        [_aginButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_aginButton setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        
//        [_aginButton addTarget:self action:@selector(show) forControlEvents:(UIControlEventTouchUpInside)];
        
        if (self.sendButton.hidden == YES) {
            _aginButton.userInteractionEnabled = NO;
        }
    }
    return _aginButton;
}

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        _sendButton.hidden = YES;
        _sendButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _sendButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:19.0];
    }
    return _sendButton;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _label.textColor = [UIColor darkGrayColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:16];
        [self timer];
    }
    return _label;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _lineLabel;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)countDown {
    
    self.label.text = [NSString stringWithFormat:@"%d秒后重试",number];
    
    number --;
    
    if (number <= 0) {
        [_timer invalidate];
        self.label.hidden = YES;
        self.sendButton.hidden = NO;
        self.aginButton.userInteractionEnabled = YES;
    }
}


@end
