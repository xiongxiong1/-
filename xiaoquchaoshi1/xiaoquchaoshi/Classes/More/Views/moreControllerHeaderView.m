//
//  moreControllerHeaderView.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/26/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "moreControllerHeaderView.h"

@interface moreControllerHeaderView ()

@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel     *address;
@property(nonatomic,strong) UILabel     *username;

@end

@implementation moreControllerHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

//添加控件
- (void)setupUI {
    [self addSubview:self.icon];
    [self addSubview:self.address];
    [self addSubview:self.username];
}

#pragma mark -- 懒加载
- (UIImageView *)icon {
    if (_icon == nil) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        _icon.image=[UIImage imageNamed:@"aa1"];
        _icon.layer.cornerRadius=20;
        _icon.clipsToBounds=YES;
    }
    return _icon;
}

- (UILabel *)address {
    if (_address == nil) {
        _address = [[UILabel alloc] initWithFrame:CGRectMake(60, 18, 150, 24)];
        _address.text=@"左岸经典(正恒园)";
    }
    return _address;
}

- (UILabel *)username {
    if (_username == nil) {
        _username = [[UILabel alloc] initWithFrame:CGRectMake(220, 18, 150, 24)];
        _username.text=@"用户名是:123";
    }
    return _username;
}


@end
