//
//  ChangePasswordController.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/26/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "ChangePasswordController.h"

@interface ChangePasswordController ()

@property(nonatomic,strong) UITextField *currentPassword;
@property(nonatomic,strong) UITextField *newpassword;
@property(nonatomic,strong) UITextField *confirmTheNewPassword;

@end

@implementation ChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    
    [self.view addSubview:self.currentPassword];
    [self.view addSubview:self.newpassword];
    [self.view addSubview:self.confirmTheNewPassword];
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(change)];
    [self.navigationItem setRightBarButtonItem:right];
}

//导航栏右边修改按钮的点击事件
- (void)change{
    
    UIAlertController *alertVc=[UIAlertController alertControllerWithTitle:@"两次输入的新密码不一致" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}

#pragma mark -- 懒加载
#pragma mark -- 当前密码
- (UITextField *)currentPassword {
    if (_currentPassword == nil) {
        _currentPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, kSCREEN_WIDTH-40, 50)];
        _currentPassword.borderStyle=UITextBorderStyleRoundedRect;
        _currentPassword.placeholder=@"请输入当前密码";
    }
    return _currentPassword;
}

#pragma mark -- newpassword
- (UITextField *)newpassword {
    if (_newpassword == nil) {
        _newpassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 170, kSCREEN_WIDTH-40, 50)];
        _newpassword.borderStyle=UITextBorderStyleRoundedRect;
        _newpassword.placeholder=@"请输入新密码";
    }
    return _newpassword;
}

#pragma mark -- ConfirmTheNewPassword
- (UITextField *)confirmTheNewPassword {
    if (_confirmTheNewPassword == nil) {
        _confirmTheNewPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 240, kSCREEN_WIDTH-40, 50)];
        _confirmTheNewPassword.borderStyle=UITextBorderStyleRoundedRect;
        _confirmTheNewPassword.placeholder=@"请确认新密码";
    }
    return _confirmTheNewPassword;
}

@end
